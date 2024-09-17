WITH UserStats2019 AS (
    SELECT 
        Users.UserName,
        COUNT(DISTINCT ForumMessageVotes.Id) AS Upvote
    FROM 
        ForumMessageVotes
    INNER JOIN Users
        ON Users.Id = ForumMessageVotes.FromUserId
    WHERE 
        substr(ForumMessageVotes.VoteDate, 7, 4) = '2019'  -- 연도 추출
    GROUP BY 
        Users.UserName
),
AverageUpvotes2019 AS (
    SELECT 
        AVG(Upvote) AS AvgUpvote2019
    FROM UserStats2019
),
UserClosestToAverage AS (
    SELECT 
        UserStats2019.UserName,
        ABS(UserStats2019.Upvote - AverageUpvotes2019.AvgUpvote2019) AS UpvoteDifference
    FROM 
        UserStats2019, AverageUpvotes2019
)
SELECT 
    UserName
FROM 
    UserClosestToAverage
ORDER BY 
    UpvoteDifference ASC,
    UserName ASC
LIMIT 1;