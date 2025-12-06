<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Calculate Progress Percentage based on Current Page -->
<c:set var="progressPercent" value="25" />
<c:if test="${currentPage eq 2}">
    <c:set var="progressPercent" value="50" />
</c:if>
<c:if test="${currentPage eq 3}">
    <c:set var="progressPercent" value="75" />
</c:if>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${moduleTitle} - HealthHub</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        body { background-color: #ffffff; color: #333; padding: 40px; }
        .container { max-width: 1000px; margin: 0 auto; }
        .module-header { margin-bottom: 30px; }
        .module-header h1 { font-size: 2rem; color: #2c3e50; font-weight: 700; margin-bottom: 10px; }
        .module-header p { color: #95a5a6; font-size: 0.95rem; }

        /* Progress Bar Styles */
        .progress-section { margin-bottom: 25px; }
        .progress-labels { display: flex; justify-content: space-between; margin-bottom: 8px; font-size: 0.9rem; color: #7f8c8d; font-weight: 600; }
        .progress-track { width: 100%; background-color: #ecf0f1; border-radius: 10px; height: 10px; overflow: hidden; }
        .progress-fill { height: 100%; background-color: #1abc9c; border-radius: 10px; transition: width 0.5s ease; }
        
        /* Dynamic Width Classes to avoid IDE validation errors with inline styles */
        .w-25 { width: 25%; }
        .w-50 { width: 50%; }
        .w-75 { width: 75%; }
        .w-100 { width: 100%; }

        .tabs-container { display: flex; gap: 10px; margin-bottom: 20px; }
        .tab { padding: 8px 30px; border-radius: 6px; font-weight: 600; font-size: 0.9rem; cursor: default; background-color: #f8f9fa; color: #95a5a6; }
        .tab.active { background-color: #ffffff; color: #333; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        .content-card { background: #ffffff; border: 1px solid #e0e0e0; border-radius: 12px; padding: 40px; box-shadow: 0 4px 20px rgba(0,0,0,0.04); margin-bottom: 30px; }
        .content-card h3 { font-size: 1.25rem; color: #2c3e50; margin-top: 25px; margin-bottom: 15px; font-weight: 700; }
        .content-card h3:first-child { margin-top: 0; }
        .content-card p { color: #7f8c8d; line-height: 1.6; margin-bottom: 15px; font-size: 1rem; }
        .content-card ul { margin-left: 20px; margin-bottom: 20px; color: #7f8c8d; }
        .content-card li { margin-bottom: 5px; line-height: 1.6; }
        .action-buttons { display: flex; justify-content: space-between; gap: 20px; }
        .btn { flex: 1; padding: 15px; border-radius: 8px; font-size: 0.9rem; font-weight: 600; text-align: center; cursor: pointer; text-decoration: none; transition: opacity 0.2s; border: none; }
        .btn:hover { opacity: 0.9; }
        .btn-save { background-color: #1abc9c; color: white; }
        .btn-continue { background-color: #00d2d3; color: white; }

        /* Modal Styles */
        .modal-overlay {
            display: none;
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 1000;
            justify-content: center;
            align-items: center;
        }
        .modal-box {
            background: white;
            padding: 30px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 4px 20px rgba(0,0,0,0.2);
            max-width: 400px;
            width: 90%;
            animation: fadeIn 0.3s ease;
        }
        .modal-icon { font-size: 3rem; color: #1abc9c; margin-bottom: 15px; }
        .modal-title { font-size: 1.25rem; font-weight: 700; color: #2c3e50; margin-bottom: 10px; }
        .modal-btn { background-color: #1abc9c; color: white; border: none; padding: 10px 24px; border-radius: 6px; font-weight: 600; cursor: pointer; margin-top: 15px; }
        @keyframes fadeIn { from { opacity: 0; transform: translateY(-10px); } to { opacity: 1; transform: translateY(0); } }
    </style>
</head>
<body>

    <div class="container">
        <div class="module-header">
            <h1>${moduleTitle}</h1>
            <p>${moduleSubtitle}</p>
        </div>

        <!-- Progress Bar Added Here -->
        <div class="progress-section">
            <div class="progress-labels">
                <span>Course Progress</span>
                <span>${progressPercent}%</span>
            </div>
            <div class="progress-track">
                <!-- Using dynamic classes (w-25, w-50, etc.) instead of inline style to prevent IDE validation errors -->
                <div class="progress-fill w-${progressPercent}"></div>
            </div>
        </div>

        <div class="tabs-container">
            <c:choose>
                <c:when test="${moduleId eq '3'}">
                    <div class="tab active">Content</div>
                    <div class="tab">Quiz Assessment</div>
                </c:when>
                <c:otherwise>
                    <div class="tab ${currentPage == 1 ? 'active' : ''}">1.0</div>
                    <div class="tab ${currentPage == 2 ? 'active' : ''}">2.0</div>
                    <div class="tab ${currentPage == 3 ? 'active' : ''}">3.0</div>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="content-card">
            ${contentHtml}
        </div>

        <div class="action-buttons">
            <!-- Modal Trigger -->
            <a href="#" onclick="showSaveModal(event)" class="btn btn-save">
                Save Progress & Leave
            </a>

            <c:choose>
                <c:when test="${moduleId eq '3'}">
                     <a href="${pageContext.request.contextPath}/content/module/${moduleId}?page=2" class="btn btn-continue">
                        Proceed to Quiz
                    </a>
                </c:when>
                <c:otherwise>
                    <c:choose>
                        <c:when test="${currentPage < 3 && not isComplete}">
                            <a href="${pageContext.request.contextPath}/content/module/${moduleId}?page=${currentPage + 1}" class="btn btn-continue">
                                Continue On
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/content/browse" class="btn btn-continue">
                                Finish Module
                            </a>
                        </c:otherwise>
                    </c:choose>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <!-- The Modal -->
    <div id="saveModal" class="modal-overlay">
        <div class="modal-box">
            <div class="modal-icon"><i class="fas fa-check-circle"></i></div>
            <div class="modal-title">Progress Saved!</div>
            <p style="color:#7f8c8d;">Your learning progress has been securely saved.</p>
            <button class="modal-btn" onclick="redirectToBrowse()">Return to Modules</button>
        </div>
    </div>

    <script>
        function showSaveModal(e) {
            e.preventDefault();
            document.getElementById('saveModal').style.display = 'flex';
        }

        function redirectToBrowse() {
            window.location.href = '${pageContext.request.contextPath}/content/browse';
        }
    </script>

</body>
</html>