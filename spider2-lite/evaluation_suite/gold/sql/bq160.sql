WITH ForumMessagesCount AS (
  SELECT 
    ForumTopicId,
    COUNT(DISTINCT Id) AS ForumMessagesCount,
    COUNT(DISTINCT PostUserId) AS ForumMessageUserRepliesCount
  FROM `spider2-public-data.meta_kaggle.ForumMessages`
  GROUP BY ForumTopicId
),
ForumTopicsUpvotes AS (
  SELECT 
    ForumTopicId,
    SUM(Instances) AS TopicsUpvotes
  FROM (
    SELECT 
      innerfms.ForumTopicId,
      COUNT(DISTINCT innerfmv.Id) AS Instances
    FROM `spider2-public-data.meta_kaggle.ForumMessages` AS innerfms
    INNER JOIN `spider2-public-data.meta_kaggle.ForumMessageVotes` AS innerfmv
      ON innerfmv.ForumMessageId = innerfms.Id
    GROUP BY innerfms.ForumTopicId
  ) AS main
  GROUP BY ForumTopicId
)
SELECT 
  ft.CreationDate AS date,
  ft.Title AS ForumTopicTitle,
  pfm.Title AS ParentForumTitle,
  COALESCE(fmc.ForumMessagesCount, 0) AS ForumTopicRepliesCount,
  COALESCE(fmc.ForumMessageUserRepliesCount, 0) AS DistinctUserRepliesCount,
  COALESCE(ftu.TopicsUpvotes, 0) AS TopicUpvotes,
  ft.TotalViews
FROM `spider2-public-data.meta_kaggle.ForumTopics` AS ft
LEFT JOIN `spider2-public-data.meta_kaggle.Forums` AS fm
  ON fm.Id = ft.ForumId
LEFT JOIN `spider2-public-data.meta_kaggle.Forums` AS pfm
  ON pfm.Id = fm.ParentForumId
LEFT JOIN ForumMessagesCount AS fmc
  ON fmc.ForumTopicId = ft.Id
LEFT JOIN ForumTopicsUpvotes AS ftu
  ON ftu.ForumTopicId = ft.Id
WHERE pfm.Title = 'General'
ORDER BY ft.CreationDate
LIMIT 5;