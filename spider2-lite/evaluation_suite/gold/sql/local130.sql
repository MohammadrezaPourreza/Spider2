SELECT 
  S1.StudLastName AS LastName,
  (CASE 
      WHEN RankInCategory <= 0.2 * NumStudents THEN 'First'
      WHEN RankInCategory <= 0.4 * NumStudents THEN 'Second'
      WHEN RankInCategory <= 0.6 * NumStudents THEN 'Third'
      WHEN RankInCategory <= 0.8 * NumStudents THEN 'Fourth'
      ELSE 'Fifth' 
   END) AS Quintile
FROM
  (SELECT 
     Students.StudLastName,
     (SELECT COUNT(*)
      FROM Classes
      INNER JOIN Student_Schedules AS SS2 ON Classes.ClassID = SS2.ClassID
      INNER JOIN Subjects AS S3 ON S3.SubjectID = Classes.SubjectID
      WHERE S3.CategoryID = 'ENG'
        AND SS2.Grade >= Student_Schedules.Grade) AS RankInCategory
   FROM 
     Subjects
   INNER JOIN Classes ON Subjects.SubjectID = Classes.SubjectID
   INNER JOIN Student_Schedules ON Student_Schedules.ClassID = Classes.ClassID
   INNER JOIN Students ON Students.StudentID = Student_Schedules.StudentID
   WHERE 
     Student_Schedules.ClassStatus = 2 
     AND Subjects.CategoryID = 'ENG'
  ) AS S1,
  (SELECT COUNT(*) AS NumStudents
   FROM Classes AS C2
   INNER JOIN Student_Schedules AS SS3 ON C2.ClassID = SS3.ClassID
   INNER JOIN Subjects AS S2 ON S2.SubjectID = C2.SubjectID
   WHERE SS3.ClassStatus = 2 
     AND S2.CategoryID = 'ENG'
  ) AS StudCount
ORDER BY 
  S1.RankInCategory DESC;