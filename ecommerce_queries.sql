-- Churn Rate

SELECT 
(COUNT(DISTINCT CASE WHEN Churn = 1 THEN CustomerID END) * 100.0) / COUNT(DISTINCT CustomerID) AS ChurnRate
FROM 
ecommerce;

-- Average Customer Satisfaction Score

SELECT AVG(SatisfactionScore) FROM ecommerce;

-- Total Number of Complaints

SELECT SUM(Complain) As Total_Number_of_Complaints
FROM ecommerce;

-- Customer Tenue
SELECT AVG(Tenure)  As Average_Customer_Tenure
FROM ecommerce;

-- Coupon Useage Rate
SELECT (COUNT(DISTINCT CASE WHEN CouponUsed = 1 THEN CustomerID END) / COUNT(DISTINCT CustomerID)) * 100 AS Percentage_Of_Customers_Using_Coupons
FROM ecommerce;

-- Chart Requirments Below

-- Churn Rate By City Tier

SELECT CityTier,
(SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END)) / COUNT(DISTINCT CustomerID) * 100 AS Churn_Rate_By_City_Tier
FROM 
ecommerce
GROUP BY CityTier
ORDER BY CityTier;


-- Average Satisfaction Score By Order Category

SELECT PreferedOrderCat,  
AVG(SatisfactionScore) AS Average_Satisfaction_Score
FROM ecommerce
GROUP BY PreferedOrderCat;

-- Tenure vs Order Count

SELECT 
Tenure, 
SUM(OrderCount) AS Total_Orders
FROM 
ecommerce
WHERE 
Tenure IS NOT NULL
GROUP BY 
Tenure
ORDER BY 
CAST(Tenure AS UNSIGNED) ASC;

-- Complaints by payment mode

SELECT PreferredPaymentMode,
COUNT(Complain) AS Complaints
FROM ecommerce
group by PreferredPaymentMode;


-- Customer Satisfaction Score By Gender
SELECT Gender, 
AVG(SatisfactionScore) AS Avg_Satisfaction_Score
FROM ecommerce
GROUP BY Gender;

-- Coupon Usage By Gender

SELECT 
Gender, 
(SUM(CASE WHEN CouponUsed = 1 THEN 1 ELSE 0 END) / COUNT(DISTINCT CustomerID)) * 100 AS Coupon_Usage_Rate_Percentage
FROM 
ecommerce
GROUP BY 
Gender;
