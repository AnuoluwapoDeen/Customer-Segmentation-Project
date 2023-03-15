SELECT * FROM subscribersdetails;

-- This is know the total amount of subscription sold for the years in view.

SELECT SUM(Next_billing_Amount) AS Total_sales
FROM subscribersdetails;

-- This is know the total number of subscriptions sold per year.

SELECT Year_of_Subscription, COUNT(Next_billing_Amount) AS Number_sales_per_year
FROM subscribersdetails
GROUP BY 1
ORDER BY Number_sales_per_year DESC, Year_of_Subscription;

-- This is know the total Amount of subscriptions sold per year.

SELECT Year_of_Subscription, SUM(Next_billing_Amount) AS Total_sales_per_year
FROM subscribersdetails
GROUP BY Year_of_Subscription
ORDER BY Total_sales_per_year DESC, Year_of_Subscription;

-- This is to fetch Minimum price of subscription.

SELECT MIN(Next_billing_Amount) AS Minimun_deal_size
FROM subscribersdetails;

-- This is to fetch Maximum price of subscription.

SELECT MAX(Next_billing_Amount) AS Maximum_deal_size
FROM subscribersdetails;

-- This is to know the average price of subscription.

SELECT AVG(Next_billing_Amount) AS Average_deal_size
FROM subscribersdetails;

-- This is to discover the year that the highest number of subscription was sold.

SELECT Industry, Year_of_Subscription, COUNT(Industry) AS year_with_MostSub
FROM subscribersdetails
GROUP BY 1,2
ORDER BY 3 DESC
LIMIT 1;

-- This to select the highest deal size, the product bought, the industry of the subscriber, and the year the subscription was bought.

SELECT account_name, editor_edition, industry, next_billing_amount, Year_of_Subscription
FROM subscribersdetails
ORDER BY Next_billing_Amount DESC
LIMIT 1;

-- On the contrary, this to select the smallest deal size, the product bought, the industry of the subscriber, and the year the subscription was bought.

SELECT account_name, editor_edition, industry, next_billing_amount, Year_of_Subscription
FROM subscribersdetails
ORDER BY Next_billing_Amount ASC
LIMIT 1;

-- This is to show the number of subscription bought per year in each industry.

SELECT Industry, Year_of_Subscription, COUNT(*) AS industry_per_year
FROM subscribersdetails
GROUP BY 1,2
ORDER BY 2 DESC;

SELECT Industry, COUNT(Industry) AS Industry_with_MostSub
FROM subscribersdetails
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- This is to segment total subscribers into four quadrants based on annual revenue and subscription value.

CREATE VIEW Quadrant AS
SELECT 
  Account_id,
  Annual_revenue,
  Industry,
  CASE 
    WHEN annual_revenue >= 40000000 AND subscription_value >= 94528.94 THEN 'Platinum'
    WHEN annual_revenue >= 30000000 AND annual_revenue < 40000000 AND subscription_value < 94528.94 THEN 'Gold'
    WHEN annual_revenue >= 20000000 AND annual_revenue < 30000000 AND subscription_value >= 94528.94 THEN 'Silver'
    ELSE 'Bronze'
  END AS Quadrant
FROM subscribersdetails;


SELECT *
FROM Quadrant;

-- This to count the number each segment (Platinum, Gold, Silver, Bronze Subscribers) in each industry.

SELECT quadrant, industry, COUNT(Account_id)
FROM Quadrant
GROUP BY 1,2
ORDER BY 3 DESC;

-- This is to know which industry bought the Apps, that is single product.

SELECT industry, COUNT(*) as Apps_count
FROM subscribersdetails
WHERE Product = 'Apps'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- This is to know which industry bought the Combo, that is combination of the four products in a bundle.

SELECT industry, COUNT(*) as Combos_count
FROM subscribersdetails
WHERE Product = ' Combo'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

