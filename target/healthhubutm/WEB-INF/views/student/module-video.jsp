<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
        .progress-fill { height: 100%; background-color: #1abc9c; width: 65%; /* Example width, can be dynamic */ border-radius: 10px; transition: width 0.5s ease; }

        .tabs-container { display: flex; gap: 10px; margin-bottom: 20px; }
        .tab { padding: 8px 30px; border-radius: 6px; font-weight: 600; font-size: 0.9rem; cursor: default; background-color: #f8f9fa; color: #95a5a6; }
        .tab.active { background-color: #ffffff; color: #333; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        .content-card { background: #ffffff; border: 1px solid #e0e0e0; border-radius: 12px; padding: 40px; box-shadow: 0 4px 20px rgba(0,0,0,0.04); margin-bottom: 30px; }
        .video-wrapper { position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; border-radius: 12px; background-color: #000; margin-bottom: 25px; }
        .video-wrapper iframe { position: absolute; top: 0; left: 0; width: 100%; height: 100%; border: 0; }
        .video-info h3 { font-size: 1.25rem; color: #2c3e50; margin-bottom: 10px; font-weight: 700; }
        .video-info p { color: #7f8c8d; line-height: 1.6; font-size: 1rem; }
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
                <span>65%</span>
            </div>
            <div class="progress-track">
                <!-- Inline style width can be replaced with ${progressPercentage}% -->
                <div class="progress-fill" style="width: 65%;"></div>
            </div>
        </div>

        <div class="tabs-container">
            <div class="tab active">Video Lesson</div>
        </div>

        <div class="content-card">
            <div class="video-wrapper">
                <!-- URL updated to embed format: /embed/ID -->
                <iframe src="https://www.youtube.com/embed/H-kl36yQN1U" title="YouTube video player" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </div>
            
            <div class="video-info">
                <h3>Key Takeaways</h3>
                <p>This video explores the subtle and obvious signs of mental health challenges. Pay attention to changes in sleep patterns, appetite, mood stability, and social withdrawal. Recognizing these signs early is the first step toward getting help.</p>
            </div>
        </div>

        <div class="action-buttons">
            <!-- Modal Trigger -->
            <a href="#" onclick="showSaveModal(event)" class="btn btn-save">
                Save Progress & Leave
            </a>

            <a href="${pageContext.request.contextPath}/content/browse" class="btn btn-continue">
                Mark as Complete
            </a>
        </div>
    </div>

    <!-- The Modal -->
    <div id="saveModal" class="modal-overlay">
        <div class="modal-box">
            <div class="modal-icon"><i class="fas fa-check-circle"></i></div>
            <div class="modal-title">Progress Saved!</div>
            <p style="color:#7f8c8d;">Your progress has been stored successfully.</p>
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