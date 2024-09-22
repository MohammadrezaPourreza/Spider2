SELECT 
    ft.CreationDate AS ForumTopicCreationDate,
    ft.Title AS ForumTopicTitle,
    pfm.Title AS ParentForumTitle,
    COALESCE(ForumMessagesCount.ForumMessagesCount, 0) AS ForumTopicRepliesCount,
    COALESCE(ForumMessagesCount.ForumMessageUserRepliesCount, 0) AS DistinctUserRepliesCount,
    COALESCE(ForumTopicsUpvotes.TopicsUpvotes, 0) AS TopicUpvotes,
    ft.TotalViews
FROM `spider2-public-data.meta_kaggle.ForumTopics` AS ft
LEFT JOIN `spider2-public-data.meta_kaggle.Forums` AS fm
    ON fm.Id = ft.ForumId
LEFT JOIN `spider2-public-data.meta_kaggle.Forums` AS pfm
    ON pfm.Id = fm.ParentForumId
LEFT JOIN (
    SELECT 
        ForumTopicId,
        COUNT(DISTINCT Id) AS ForumMessagesCount,
        COUNT(DISTINCT PostUserId) AS ForumMessageUserRepliesCount
    FROM `spider2-public-data.meta_kaggle.ForumMessages`
    GROUP BY ForumTopicId
) AS ForumMessagesCount
    ON ForumMessagesCount.ForumTopicId = ft.Id
LEFT JOIN (
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
) AS ForumTopicsUpvotes
    ON ForumTopicsUpvotes.ForumTopicId = ft.Id
WHERE ft.CreationDate >= '2022-01-01'
    AND pfm.Title = 'General'
ORDER BY ft.CreationDate
LIMIT 5