<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Content Quality - HealthHub MHP</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        /* --- GLOBAL STYLES --- */
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        body { background-color: #ffffff; color: #333; padding: 40px; }
        
        /* Updated layout to be full width since sidebar is gone */
        .main-layout { display: block; max-width: 1400px; margin: 0 auto; }
        .content-column { width: 100%; }
        
        /* --- PERFORMANCE OVERVIEW CARD --- */
        .quality-container {
            border: 1px solid #eee;
            border-radius: 12px;
            padding: 30px;
            background-color: #fff;
            box-shadow: 0 4px 15px rgba(0,0,0,0.02);
        }

        .section-title { font-size: 1.4rem; color: #2c3e50; font-weight: 600; margin-bottom: 5px; }
        .section-subtitle { color: #95a5a6; font-size: 0.9rem; margin-bottom: 30px; display: block; }

        /* --- METRIC CARDS ROW --- */
        .metrics-row {
            display: flex;
            gap: 20px;
            margin-bottom: 40px;
        }

        .metric-card {
            flex: 1;
            border: 1px solid #eee;
            border-radius: 10px;
            padding: 20px;
            background-color: #fff;
            transition: transform 0.2s;
        }
        
        .metric-card:hover { transform: translateY(-2px); box-shadow: 0 4px 10px rgba(0,0,0,0.05); }

        .metric-header { display: flex; align-items: center; gap: 10px; margin-bottom: 15px; font-weight: 600; font-size: 1rem; }
        .metric-header i { font-size: 1.1rem; }
        
        .metric-value { font-size: 2rem; font-weight: 700; color: #2c3e50; margin-bottom: 5px; display: block; }
        .metric-desc { color: #95a5a6; font-size: 0.85rem; }

        /* Color variations for metrics */
        .status-published { color: #27ae60; } /* Green */
        .status-review { color: #3498db; }    /* Blue */
        .status-flagged { color: #e74c3c; }   /* Red */

        /* --- TOP RATED LIST --- */
        .list-header { font-size: 1.1rem; color: #2c3e50; font-weight: 600; margin-bottom: 15px; }

        .rated-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #f8f9fa; 
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 15px;
        }

        .item-info h4 { color: #2c3e50; font-size: 1rem; margin-bottom: 5px; font-weight: 600; }
        .item-views { color: #95a5a6; font-size: 0.85rem; }

        .item-rating { display: flex; align-items: center; gap: 8px; font-weight: 700; color: #2c3e50; font-size: 1.1rem; }
        .item-rating i { color: #f39c12; font-size: 1rem; } /* Gold Star */

    </style>
</head>
<body>

    <div class="main-layout">
        <div class="content-column">
            
            <!-- Removed Page Header (Back Button) -->

            <div class="quality-container">
                
                <div class="section-title">Content Performance Overview</div>
                <span class="section-subtitle">Quality metrics and engagement</span>

                <div class="metrics-row">
                    <div class="metric-card">
                        <div class="metric-header status-published">
                            <i class="far fa-check-circle"></i> Published
                        </div>
                        <span class="metric-value">156</span>
                        <span class="metric-desc">All content types</span>
                    </div>

                    <div class="metric-card">
                        <div class="metric-header status-review">
                            <i class="fas fa-wave-square"></i> In Review
                        </div>
                        <span class="metric-value">23</span>
                        <span class="metric-desc">Pending approval</span>
                    </div>

                    <div class="metric-card">
                        <div class="metric-header status-flagged">
                            <i class="far fa-times-circle"></i> Flagged
                        </div>
                        <span class="metric-value">7</span>
                        <span class="metric-desc">Needs attention</span>
                    </div>
                </div>

                <div class="list-header">Top Rated Content</div>

                <div class="rated-item">
                    <div class="item-info">
                        <h4>Understanding Stress</h4>
                        <span class="item-views">1250 views</span>
                    </div>
                    <div class="item-rating">
                        <i class="fas fa-star"></i> 4.8
                    </div>
                </div>

                <div class="rated-item">
                    <div class="item-info">
                        <h4>Mindfulness Guide</h4>
                        <span class="item-views">980 views</span>
                    </div>
                    <div class="item-rating">
                        <i class="fas fa-star"></i> 4.7
                    </div>
                </div>

                <div class="rated-item">
                    <div class="item-info">
                        <h4>Sleep Hygiene Tips</h4>
                        <span class="item-views">845 views</span>
                    </div>
                    <div class="item-rating">
                        <i class="fas fa-star"></i> 4.6
                    </div>
                </div>

                <%-- 
                <c:forEach var="content" items="${topRatedList}">
                    <div class="rated-item">
                        <div class="item-info">
                            <h4>${content.title}</h4>
                            <span class="item-views">${content.viewCount} views</span>
                        </div>
                        <div class="item-rating">
                            <i class="fas fa-star"></i> ${content.rating}
                        </div>
                    </div>
                </c:forEach>
                --%>

            </div>
        </div>

</body>
</html>