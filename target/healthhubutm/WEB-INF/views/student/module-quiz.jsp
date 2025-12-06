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
        .progress-fill { height: 100%; background-color: #1abc9c; border-radius: 10px; transition: width 0.5s ease; }

        .tabs-container { display: flex; gap: 10px; margin-bottom: 20px; }
        .tab { padding: 8px 30px; border-radius: 6px; font-weight: 600; font-size: 0.9rem; cursor: default; background-color: #f8f9fa; color: #95a5a6; }
        .tab.active { background-color: #ffffff; color: #333; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        .content-card { background: #ffffff; border: 1px solid #e0e0e0; border-radius: 12px; padding: 40px; box-shadow: 0 4px 20px rgba(0,0,0,0.04); margin-bottom: 30px; }
        .question-block { margin-bottom: 30px; padding-bottom: 20px; border-bottom: 1px solid #f0f0f0; }
        .question-block:last-child { border-bottom: none; }
        .question-text { font-size: 1.1rem; font-weight: 600; color: #2c3e50; margin-bottom: 15px; }
        .options-list { list-style: none; }
        .option-item { margin-bottom: 10px; }
        .option-label { display: flex; align-items: center; cursor: pointer; padding: 10px 15px; border-radius: 8px; border: 1px solid #e0e0e0; transition: background-color 0.2s; }
        .option-label:hover { background-color: #f9f9f9; }
        .option-label input[type="radio"] { margin-right: 15px; accent-color: #00d2d3; transform: scale(1.2); }
        #resultContainer { display: none; margin-top: 20px; padding: 20px; border-radius: 8px; text-align: center; font-weight: bold; }
        .success-score { background-color: #d1fae5; color: #065f46; border: 1px solid #a7f3d0; }
        .fail-score { background-color: #fee2e2; color: #991b1b; border: 1px solid #fecaca; }
        .action-buttons { display: flex; justify-content: space-between; gap: 20px; }
        .btn { flex: 1; padding: 15px; border-radius: 8px; font-size: 0.9rem; font-weight: 600; text-align: center; cursor: pointer; text-decoration: none; transition: opacity 0.2s; border: none; }
        .btn:hover { opacity: 0.9; }
        .btn-save { background-color: #1abc9c; color: white; }
        .btn-submit { background-color: #00d2d3; color: white; }
        .btn-disabled { background-color: #bdc3c7; cursor: not-allowed; }

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
                <span>90%</span>
            </div>
            <div class="progress-track">
                <div class="progress-fill" style="width: 90%;"></div>
            </div>
        </div>

        <div class="tabs-container">
            <div class="tab">Content</div>
            <div class="tab active">Quiz Assessment</div>
        </div>

        <form id="quizForm">
            <div class="content-card">
                <c:forEach var="q" items="${quizQuestions}" varStatus="status">
                    <div class="question-block" id="qblock-${status.index}">
                        <div class="question-text">${status.index + 1}. ${q.question}</div>
                        <ul class="options-list">
                            <c:forEach var="opt" items="${q.options}" varStatus="optStatus">
                                <li class="option-item">
                                    <label class="option-label">
                                        <input type="radio" name="question_${q.id}" value="${optStatus.index}" data-is-correct="${optStatus.index == q.correctIndex}">
                                        ${opt}
                                    </label>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </c:forEach>
                <div id="resultContainer"></div>
            </div>

            <div class="action-buttons">
                <!-- Modal Trigger -->
                <a href="#" onclick="showSaveModal(event)" class="btn btn-save">
                    Save Progress & Leave
                </a>
                <button type="button" class="btn btn-submit" onclick="submitQuiz()">
                    Submit Answers
                </button>
            </div>
        </form>
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

        function submitQuiz() {
            let totalQuestions = document.querySelectorAll('.question-block').length;
            let correctCount = 0;
            let allAnswered = true;

            for (let i = 0; i < totalQuestions; i++) {
                let block = document.getElementById('qblock-' + i);
                let selectedOption = block.querySelector('input[type="radio"]:checked');
                block.querySelectorAll('.option-label').forEach(lbl => {
                    lbl.style.backgroundColor = ''; 
                    lbl.style.borderColor = '#e0e0e0';
                });

                if (!selectedOption) {
                    allAnswered = false;
                    continue; 
                }

                let isCorrect = selectedOption.getAttribute('data-is-correct') === 'true';
                if (isCorrect) {
                    correctCount++;
                    selectedOption.parentElement.style.backgroundColor = '#d1fae5'; 
                    selectedOption.parentElement.style.borderColor = '#34d399';
                } else {
                    selectedOption.parentElement.style.backgroundColor = '#fee2e2'; 
                    selectedOption.parentElement.style.borderColor = '#f87171';
                }
            }

            if (!allAnswered) {
                alert("Please answer all questions before submitting.");
                return;
            }

            let resultDiv = document.getElementById("resultContainer");
            resultDiv.style.display = "block";
            let percentage = (correctCount / totalQuestions) * 100;
            let submitBtn = document.querySelector('.btn-submit');
            
            if (percentage >= 70) {
                resultDiv.className = "success-score";
                resultDiv.innerHTML = "Great job! You scored " + correctCount + "/" + totalQuestions + " (" + percentage.toFixed(0) + "%). Module Complete!";
                submitBtn.innerText = "Mark as Complete";
                submitBtn.setAttribute("onclick", "window.location.href='${pageContext.request.contextPath}/content/browse'");
                
                // Update Progress Bar to 100% on success
                document.querySelector('.progress-fill').style.width = '100%';
                document.querySelector('.progress-labels span:last-child').innerText = '100%';
            } else {
                resultDiv.className = "fail-score";
                resultDiv.innerHTML = "You scored " + correctCount + "/" + totalQuestions + ". Review the content and try again.";
                submitBtn.innerText = "Retake Quiz";
                submitBtn.setAttribute("onclick", "location.reload()");
            }
        }
    </script>

</body>
</html>