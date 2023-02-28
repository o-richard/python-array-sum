/*

Julia conducted a  days of learning SQL contest. The start date of the contest was March 01, 2016 and the end date was March 15, 2016.

Write a query to print total number of unique hackers who made at least  submission each day (starting on the first day of the contest), and find the hacker_id and name of the hacker who made maximum number of submissions each day. If more than one such hacker has a maximum number of submissions, print the lowest hacker_id. The query should print this information for each day of the contest, sorted by the date.

https://www.hackerrank.com/challenges/15-days-of-learning-sql/problem

*/

SELECT 
    s.submission_date, 
    (
        SELECT COUNT(DISTINCT s2.hacker_id)
        FROM Submissions s2
        WHERE s2.submission_date = s.submission_date AND
        (
            SELECT COUNT(DISTINCT s3.submission_date) 
            FROM Submissions s3 
            WHERE s3.hacker_id = s2.hacker_id AND 
            s3.submission_date < s.submission_date
        ) = DATEDIFF(s.submission_date, '2016-03-01')
    ),
    (
        SELECT s2.hacker_id 
        FROM Submissions s2 
        WHERE s2.submission_date = s.submission_date 
        GROUP BY s2.hacker_id 
        ORDER BY COUNT(s2.submission_id) DESC, s2.hacker_id LIMIT 1
    ) AS tmp, 
    (
        SELECT h.name 
        FROM hackers h
        WHERE h.hacker_id = tmp
    ) 
FROM 
    (
        SELECT DISTINCT submission_date 
        FROM Submissions
    ) s 
GROUP BY 
    s.submission_date
