--==================================================================================================================
--==================================================================================================================
--==============                         [(DEPI) ROUND 3 DATA ANALYSIS TRACK] GRADUATION PROJECT      ==============
--==============                         PROJECT NAME : MANUFACTURING DOWNTIME PROJECT                ==============
--==============                         TEAM NAME : INGITHS MAKERS                                   ==============
--==================================================================================================================
--==================================================================================================================

/*

-- INITIAL STEPS FOR CREATE DATA BASE AND USE IT 
CREATE DATABASE Manufactruing
GO
USE Manufactruing

--*/

-- KNOWING THE NUMBERS OF ROWS IN EACH TABLE .

--   COUNT OF MACHINE_INFOR TABLE .
SELECT COUNT(*) 
FROM Machine_info

-- COUNT OF MACHINE DOWNTIME TABLE .
SELECT COUNT(*) 
FROM Machine_Downtime 


--=========================================================================================================================


--               MAKE FOREIGN KEY IN MACHINE DOWNTIME INFO 


ALTER TABLE Machine_Downtime ADD CONSTRAINT C1 FOREIGN KEY (Machine_ID) REFERENCES Machine_Info(Machine_ID)
--*********************************************************************************************************************
--							    Machine_Downtime SHEET

--  COUNT_OF _DOWNINTIME , SUM_OF_DURATION_ON_HOURS , AVG_OF_DURATION_ON_HOURS
--"ما عدد حالات التوقف خلال عام 2024، وما إجمالي مدتها، وما متوسط مدة التوقف بالساعات؟
--"What is the total number of downtime events in 2024, along with their total duration and the average downtime duration in hours?" 

SELECT COUNT(Duration_hours) AS COUNT_OF_DOWNTIME, SUM(Duration_hours)	AS SUM_OF_DURATION_ON_HOURS, AVG(Duration_hours) AS AVG_OF_DURATION_ON_HOURS
FROM Machine_Downtime


--=========================================================================================================================


-- COUNT_OF_DOWNTIME , START_DIWB_MONTH , TOTAL_DURATION_HOURS
--"ما عدد حالات التوقف في كل شهر خلال عام 2024، وما إجمالي مدة التوقف بالساعات لكل شهر؟"
--"What is the number of downtime events per month in 2024, along with the total downtime duration in hours for each month?"
SELECT COUNT(Duration_hours) AS COUNT_OF_DOWNTIME, Start_Down_month  ,  SUM(Duration_hours) AS TOTAL_DURATION_HOURS
FROM Machine_Downtime
GROUP BY Start_Down_month 
ORDER BY  Start_Down_month 


--=========================================================================================================================


--RELATIONSHIP BETWEEN DURATION HOURS AND SHIFT
--"ما عدد حالات التوقف لكل شيفت خلال عام 2024، وما إجمالي مدة التوقف بالساعات لكل شيفت؟"
--"What is the number of downtime events for each shift in 2024, along with the total downtime duration in hours for each shift?"
SELECT COUNT(Duration_hours) AS COUNT_OF_DOWNTIME, Shift ,  SUM(Duration_hours) AS TOTAL_DURATION_HOURS
FROM Machine_Downtime
GROUP BY  SHIFT
ORDER BY TOTAL_DURATION_HOURS DESC


--=========================================================================================================================


-- RELATION BETWEEN DURATION HOURS , SHIFT AND MONTH
--"ما عدد حالات التوقف لكل شيفت في كل شهر خلال عام 2024، وما إجمالي مدة التوقف بالساعات لكل مجموعة شهر-شيفت؟"
--"What is the number of downtime events for each shift in each month of 2024, along with the total downtime duration in hours for each month-shift combination?"
SELECT COUNT(Duration_hours) AS COUNT_OF_DOWNTIME, Start_Down_month , Shift , SUM(Duration_hours) AS TOTAL_DURATION_HOURS
FROM Machine_Downtime
GROUP BY Start_Down_month , SHIFT
ORDER BY Start_Down_month 


--=========================================================================================================================


--      RELATION BETWEEN DURATION HOURS AND COUNT OF DOWNTIME PER MACHINE NAME
--"ما إجمالي مدة التوقف بالساعات وعدد حالات التوقف لكل ماكينة خلال عام 2024؟"
--"What is the total downtime duration in hours and the number of downtime events for each machine in 2024?"

SELECT  Machine_Name , SUM(Duration_hours) AS TOTAL_DURATION_HOURS , COUNT(Duration_hours) AS COUNT_OF_DOWNTIME
FROM Machine_Downtime
GROUP BY Machine_Name 
ORDER BY TOTAL_DURATION_HOURS DESC


--=========================================================================================================================


--          RELATION BETWEEN DEPARTMENT , DURATION AND COUNT OF DOWNTIME 
--
SELECT  Department , SUM(Duration_hours) AS TOTAL_DURATION_HOURS , COUNT(Duration_hours) AS COUNT_OF_DOWNTIME
FROM Machine_Downtime
GROUP BY Department 
ORDER BY TOTAL_DURATION_HOURS DESC


--=========================================================================================================================


--      RELATIONSHIP BETWEEN OPERATOR , TOTAL DURATION AND COUNT OF DOWNTIME    
--ما إجمالي مدة التوقف بالساعات وعدد حالات التوقف لكل قسم خلال عام 2024؟"
--"What is the total downtime duration in hours and the number of downtime events for each department in 2024?"
SELECT  Operator , SUM(Duration_hours) AS TOTAL_DURATION_HOURS ,COUNT(Duration_hours) AS COUNT_OF_DOWNTIME
FROM Machine_Downtime
GROUP BY Operator 
ORDER BY TOTAL_DURATION_HOURS DESC


--=========================================================================================================================


--    RELATIONSHIP BETWEEN TOTAL DURATION HOURS AND COUNT OF DOWNTIME  
--"ما إجمالي مدة التوقف بالساعات وعدد حالات التوقف لكل سبب توقف خلال عام 2024؟"
--"What is the total downtime duration in hours and the number of downtime events for each downtime reason in 2024?"
SELECT  Downtime_Reason , SUM(Duration_hours) AS TOTAL_DURATION_HOURS , COUNT(Duration_hours) AS COUNT_OF_DOWNTIME
FROM Machine_Downtime 
GROUP BY Downtime_Reason 
ORDER BY TOTAL_DURATION_HOURS DESC


--=========================================================================================================================


--    RELATIONSHIP BETWEEN TOTAL DURAION HOURS AND COUNT OF DOWNTIME PER PLANNED
--"ما إجمالي مدة التوقف بالساعات وعدد حالات التوقف لكل نوع توقف خلال عام 2024، سواء كانت مخططة للصيانة أو غير مخططة بسبب أعطال؟"
--"What is the total downtime duration in hours and the number of downtime events for each type of downtime in 2024, distinguishing between planned maintenance and unplanned failures?"
--( 1 =  planned maintenance) ---(0 = unplanned failures)
SELECT  Planned , SUM(Duration_hours) AS TOTAL_DURATION_HOURS , COUNT(Duration_hours) AS COUNT_OF_DOWNTIME 
FROM Machine_Downtime
GROUP BY Planned 



--***********************************************************************************************************************
--					                    		MACHINE_INFORMATION SHEET


--      RELATIONSHIP BETWEEN MANUFACTURER AND TOTAL DURATION HOURS
--"ما المصنع الذي كانت ماكيناته الأكثر توقفًا من حيث إجمالي مدة التوقف في عام 2024؟"
--"Which manufacturer’s machines experienced the most downtime in terms of total hours in 2024?"

SELECT  I.Manufacturer , SUM(D.Duration_hours) AS TOTAL_DURATION_HOURS
FROM Machine_Downtime D inner join Machine_Info I 
ON D.Machine_ID = I.Machine_ID
GROUP BY  I.Manufacturer
ORDER BY TOTAL_DURATION_HOURS DESC


--=========================================================================================================================


--"أي مصنع للماكينات يحتاج إلى أكبر قدر من الصيانة المخططة خلال عام 2024؟"
--"Which machine manufacturer required the most planned maintenance in 2024?"
SELECT  I.Manufacturer , SUM(D.Duration_hours) AS TOTAL_DURATION_HOURS
FROM Machine_Downtime D inner join Machine_Info I 
ON D.Machine_ID = I.Machine_ID
where Planned = 'Maintenance'
GROUP BY  I.Manufacturer
ORDER BY TOTAL_DURATION_HOURS DESC


--=========================================================================================================================


--"أي مصنع سجلت ماكيناته أكثر توقف غير مخطط بسبب الأعطال خلال عام 2024؟"
--"Which manufacturer had the most unplanned downtime due to failures in 2024?"
SELECT  I.Manufacturer , SUM(D.Duration_hours) AS TOTAL_DURATION_HOURS
FROM Machine_Downtime D inner join Machine_Info I 
ON D.Machine_ID = I.Machine_ID
where Planned = 'Failure'
GROUP BY  I.Manufacturer
ORDER BY TOTAL_DURATION_HOURS DESC


--=========================================================================================================================


--      RELATIONSHIP BETWEEN MANUFACTURER AND TOTAL MACHINES
--"ما عدد الماكينات التابعة لكل مصنع، وأي مصنع يمتلك أكبر أسطول من الماكينات المسجلة في عام 2024؟"
--"What is the number of machines for each manufacturer, and which manufacturer has the largest fleet of registered machines in 2024?"
SELECT  I.Manufacturer , COUNT(D.Machine_ID) AS TOTAL_MACHINES
FROM Machine_Downtime D inner join Machine_Info I 
ON D.Machine_ID = I.Machine_ID
GROUP BY  I.Manufacturer
ORDER BY TOTAL_MACHINES DESC


--=========================================================================================================================


--     RELATIONSHIP MANUFATURER AND TOTAL DURATION HOURS PER MACHINE NAME 
--"ما إجمالي مدة التوقف لكل ماكينة ومن أي مصنع تنتمي هذه الماكينات خلال عام 2024، وأي ماكينة سجلت أطول مدة توقف؟"
--"What is the total downtime duration for each machine and its manufacturer in 2024, and which machine

SELECT D.Machine_Name , I.Manufacturer , SUM(D.Duration_hours) AS TOTAL_DURATION_HOURS
FROM Machine_Downtime D inner join Machine_Info I 
ON D.Machine_ID = I.Machine_ID
GROUP BY D.Machine_Name , I.Manufacturer
ORDER BY TOTAL_DURATION_HOURS DESC

--=========================================================================================================================


 --     RELATIONSHIP BETWEEN MACHINE AGE , SUM OF DURATION HOURS AND MANTAINCE
 --"ما إجمالي مدة التوقف المخطط وغير المخطط لكل ماكينة خلال عام 2024، مع ذكر عمر الماكينة والشركة المصنعة لها؟"
--"What is the total planned and unplanned downtime for each machine in 2024, including the machine’s age and its manufacturer?"
SELECT 
    D.Machine_Name,
    I.Machine_Age,
    I.Manufacturer,
    SUM(CASE WHEN D.Planned = 'Maintenance ' THEN D.Duration_hours ELSE 0 END) AS TOTAL_DURATION_HOURS_PLANNED,
    SUM(CASE WHEN D.Planned = 'Failure ' THEN D.Duration_hours ELSE 0 END) AS TOTAL_DURATION_HOURS_UNPLANNED
FROM Machine_Info I
INNER JOIN Machine_Downtime D
    ON I.Machine_ID = D.Machine_ID
GROUP BY 
    D.Machine_Name,
    I.Machine_Age,
    I.Manufacturer

--=========================================================================================================================


--     RELATIONSHIP BETWEEN DURATION HOURS , TARGET RUNTIME HOURS DAY AND RUNTIME PER DAY 
--"ما بيانات الأداء لكل ماكينة خلال عام 2024، بما في ذلك ساعات التشغيل المستهدفة، والساعات الفعلية، ونسبة الكفاءة السنوية؟"
--"What are the performance metrics for each machine in 2024, including target runtime hours, actual runtime hours, and annual efficiency score?"
SELECT D.Machine_Name,I.Target_Runtime_Hours_year,I.Total_Runtime_Hours_year ,I.Efficiency_Score_year 
FROM Machine_Info I
INNER JOIN Machine_Downtime D
    ON I.Machine_ID = D.Machine_ID

--=========================================================================================================================


--  RELATIONSHIP BETWEEN SUM OF DURATION HOURS AND EFFICIENCY SCORE YEAR (PER MACHINE NAME)
-- ما إجمالي مدة التوقف لكل ماكينة خلال عام 2024 نتيجة عمليات الفحص المخطط (Planned Inspection)، مع عرض نسبة الكفاءة السنوية لكل ماكينة؟"
--"What is the total downtime for each machine in 2024 due to Electrical Fault, along with each machine’s annual efficiency score?"
SELECT DISTINCT D.Machine_Name ,SUM(D.Duration_hours) AS SUM_OF_Duration_hours , I.Efficiency_Score_year
FROM Machine_Downtime D INNER JOIN Machine_Info I
ON D.Machine_ID = I.Machine_ID
WHERE D.Downtime_Reason = 'Electrical Fault' 
GROUP BY D.Machine_Name , I.Efficiency_Score_year
ORDER BY SUM_OF_Duration_hours


--=========================================================================================================================

--  NUMBER OF MACHINES FOR EACH COMPANY
--  "عدد الماكينات من كل مؤسسة"
--"What is the total NUMBER OF MACHINES for each COMPANY ?"
select I.Manufacturer ,COUNT(D.Machine_Name) AS Count_of_machines
FROM Machine_Downtime D INNER JOIN Machine_Info I
ON D.Machine_ID = I.Machine_ID
group by I.Manufacturer