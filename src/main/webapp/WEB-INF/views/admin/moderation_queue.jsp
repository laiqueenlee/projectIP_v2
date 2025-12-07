<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Moderation Queue - Admin</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        body { background-color: #ffffff; color: #333; padding: 40px; }
        
        .main-container { max-width: 1000px; margin: 0 auto; }
        .page-header { margin-bottom: 30px; }
        .page-header h1 { font-size: 1.5rem; color: #2c3e50; font-weight: 700; margin-bottom: 5px; }
        .page-header p { color: #95a5a6; font-size: 0.9rem; }

        /* QUEUE CARD ITEM */
        .queue-card {
            border: 1px solid #e0e0e0;
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 20px;
            background-color: #fff;
            box-shadow: 0 2px 8px rgba(0,0,0,0.02);
            position: relative;
        }

        .badges { display: flex; gap: 10px; margin-bottom: 12px; align-items: center; }
        .badge { padding: 4px 12px; border-radius: 20px; font-size: 0.75rem; font-weight: 600; }
        .badge-type { background-color: #f1f2f6; color: #57606f; border: 1px solid #dfe4ea; }
        .badge-high { background-color: #ff4757; color: white; }
        .badge-medium { background-color: #1abc9c; color: white; }
        .badge-low { background-color: #d1d8e0; color: #57606f; }
        .alert-icon { position: absolute; top: 20px; right: 20px; color: #e74c3c; font-size: 1.1rem; }

        .content-title { font-size: 1.1rem; font-weight: 600; color: #2f3542; margin-bottom: 4px; }
        .content-author { font-size: 0.85rem; color: #747d8c; margin-bottom: 15px; display: block; }
        .flag-reason { font-size: 0.9rem; color: #747d8c; margin-bottom: 20px; }
        .flag-reason span { color: #a4b0be; }

        .action-buttons { display: flex; gap: 10px; }
        .btn { padding: 8px 20px; border-radius: 6px; font-size: 0.9rem; font-weight: 600; cursor: pointer; border: none; text-decoration: none; transition: all 0.2s; }
        .btn-approve { background-color: #00d2d3; color: white; }
        .btn-approve:hover { background-color: #00b8b9; }
        .btn-review { background-color: white; color: #2f3542; border: 1px solid #dfe4ea; }
        .btn-review:hover { background-color: #f1f2f6; }
        .btn-remove { background-color: #ff4757; color: white; }
        .btn-remove:hover { background-color: #ff3041; }

        .empty-state { text-align: center; padding: 50px; color: #a4b0be; }
        .empty-state i { font-size: 3rem; margin-bottom: 15px; display: block; }

        /* --- MODAL STYLES (NEW) --- */
        .modal-overlay {
            display: none; /* Hidden by default */
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background-color: rgba(0,0,0,0.5);
            z-index: 1000;
            justify-content: center;
            align-items: center;
        }

        .modal-box {
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            width: 90%;
            max-width: 600px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            position: relative;
        }

        .modal-header h2 { font-size: 1.4rem; color: #2c3e50; margin-bottom: 5px; }
        .modal-header span { color: #95a5a6; font-size: 0.9rem; }
        
        .modal-body {
            margin-top: 20px;
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 8px;
            border-left: 4px solid #00d2d3;
            font-size: 1rem;
            line-height: 1.6;
            color: #333;
            max-height: 300px;
            overflow-y: auto;
        }

        .modal-close-btn {
            margin-top: 20px;
            width: 100%;
            padding: 12px;
            background-color: #2c3e50;
            color: white;
            border: none;
            border-radius: 6px;
            font-weight: 600;
            cursor: pointer;
        }
        .modal-close-btn:hover { background-color: #34495e; }

    </style>
</head>
<body>

    <div class="main-container">
        <div class="page-header">
            <h1>Content Moderation Queue</h1>
            <p>Items requiring review</p>
        </div>

        <c:if test="${empty queueItems}">
            <div class="empty-state">
                <i class="fas fa-check-circle"></i>
                <h3>All caught up!</h3>
                <p>No content currently requires moderation.</p>
            </div>
        </c:if>

        <c:forEach var="item" items="${queueItems}">
            <div class="queue-card">
                <div class="badges">
                    <span class="badge badge-type">${item.type}</span>
                    <span class="badge badge-${item.severity}">${item.severity}</span>
                </div>

                <c:if test="${item.severity == 'high'}">
                    <i class="fas fa-exclamation-triangle alert-icon"></i>
                </c:if>

                <div class="content-title">${item.title}</div>
                <span class="content-author">by ${item.author}</span>
                
                <div class="flag-reason">
                    <span>Flagged for:</span> ${item.reason}
                </div>

                <!-- HIDDEN DATA DIV for JavaScript to read -->
                <div id="content-data-${item.id}" style="display:none;">
                    <c:out value="${item.contentBody}" />
                </div>

                <div class="action-buttons">
                    <!-- Approve Form -->
                    <form action="${pageContext.request.contextPath}/admin/approve" method="post" 
                          onsubmit="return confirm('Are you sure you want to APPROVE this content?');">
                        <input type="hidden" name="id" value="${item.id}">
                        <button type="submit" class="btn btn-approve">Approve</button>
                    </form>

                    <!-- REVIEW BUTTON (Updated) -->
                    <button type="button" class="btn btn-review" 
                            onclick="openModal('${item.title}', '${item.author}', '${item.id}')">
                        Review
                    </button>

                    <!-- Remove Form -->
                    <form action="${pageContext.request.contextPath}/admin/delete" method="post" 
                          onsubmit="return confirm('Are you sure you want to REMOVE this content?');">
                        <input type="hidden" name="id" value="${item.id}">
                        <button type="submit" class="btn btn-remove">Remove</button>
                    </form>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- REVIEW MODAL -->
    <div id="reviewModal" class="modal-overlay">
        <div class="modal-box">
            <div class="modal-header">
                <h2 id="modalTitle">Title Goes Here</h2>
                <span id="modalAuthor">by Author</span>
            </div>
            <div class="modal-body" id="modalContent">
                Content goes here...
            </div>
            <button class="modal-close-btn" onclick="closeModal()">Close Review</button>
        </div>
    </div>

    <script>
        function openModal(title, author, id) {
            // Get content from the hidden div
            var content = document.getElementById('content-data-' + id).innerHTML;

            // Set content in Modal
            document.getElementById('modalTitle').innerText = title;
            document.getElementById('modalAuthor').innerText = 'by ' + author;
            document.getElementById('modalContent').innerHTML = content;

            // Show Modal
            document.getElementById('reviewModal').style.display = 'flex';
        }

        function closeModal() {
            document.getElementById('reviewModal').style.display = 'none';
        }

        // Close modal if user clicks outside the box
        window.onclick = function(event) {
            var modal = document.getElementById('reviewModal');
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>

</body>
</html>