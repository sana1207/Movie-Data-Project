--------------------------------------------------------------------------------------------------------------------------------------


Select *
From Mo..Movie

---- 1) Profit from movies 

Select SUM(gross) as Total_Gross, SUM(budget) as Total_Budget, SUM(gross)- SUM(budget)  as Total_Profit
From Mo..Movie
-------------------------------------------------------------------------------------------------------------------------------------

---- 2) Countries Producing most movies 

Select count(country) as no, country
From  Mo..Movie
Group by country
Order by  no desc

-------------------------------------------------------------------------------------------------------------------------------------

---- 3) Highest grossing movie from 2016 - 2007

Select TOP 10 CONCAT(YEAR, '-', Name) as Movie_Every_Year , gross, budget
From Mo..Movie
where gross IN( Select MAX(gross)
                  From Mo..Movie
                 group by year)
order by year desc 

----------------------------------------------------------------------------------------------------------------------------------

---- 4) Highest grossing director of all time

Select TOP 10 director as Director, CAST(AVG(gross)as INT) as Avg_Gross 
From Mo..Movie
where Country = 'USA'
group by director
order by Avg_Gross desc


----------------------------------------------------------------------------------------------------------------------------------

---- 5) Highest rated directors worldwide

Select TOP 10 CAST(AVG(score) as INT) as avg_score, director 
From Mo..Movie
group by director
order by avg_score desc


----------------------------------------------------------------------------------------------------------------------------------

---- 6) Percentage in grossing movie 

Select TOP 5 country, CAST( SUM(gross)/228455191158 * 100 as INT) as  gross_perce_per_country
From  Mo..Movie
group by country
order by gross_perce_per_country desc


----------------------------------------------------------------------------------------------------------------------------------

---- 7) Most Profitable movie genre

Select TOP 5 (SUM(gross)-SUM(budget)) as most_profitable, genre
From  Mo..Movie
where Country = 'USA'AND GROSS != 0  AND budget != 0
group by genre
order by most_profitable desc 

---- Least Profitable genre

Select (SUM(gross)-SUM(budget)) as most_profitable, genre
From  Mo..Movie
where Country = 'USA'AND GROSS != 0  AND budget != 0 
group by genre
order by most_profitable 


--------------------------------------------------------------------------------------------------------------------------------

