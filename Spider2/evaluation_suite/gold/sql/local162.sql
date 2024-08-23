WITH AllISCourses AS (
    SELECT DISTINCT CourseNo
    FROM Offering
    WHERE CourseNo LIKE 'IS%' 
    AND SUBSTR(CourseNo, 3, 1) BETWEEN '0' AND '9'
),
TotalISCourseCount AS (
    SELECT COUNT(*) AS TotalCourses
    FROM AllISCourses
),
QualifiedStudents AS (
    SELECT Enrollment.StdNo
    FROM Enrollment
    JOIN Offering 
    ON Enrollment.OfferNo = Offering.OfferNo
    WHERE Offering.CourseNo IN (SELECT CourseNo FROM AllISCourses)
    AND Enrollment.EnrGrade >= 3.0
    GROUP BY Enrollment.StdNo
    HAVING COUNT(DISTINCT Offering.CourseNo) = (SELECT TotalCourses FROM TotalISCourseCount)
)
SELECT COUNT(*) AS 'Num of student'
FROM QualifiedStudents;
