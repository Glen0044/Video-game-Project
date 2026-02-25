-- Check dữ liệu trùng
SELECT id, COUNT(*) AS so_lan
FROM dbo.game
GROUP BY id
HAVING COUNT(*) > 1;

-- Xóa bản ghi trùng
WITH cte AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY game_id, publisher_id
               ORDER BY id
           ) AS rn
    FROM dbo.game_publisher
)
DELETE FROM cte
WHERE rn > 1;

-- Check khóa ngoại bị lỗi
SELECT gp.*
FROM dbo.game_publisher gp
LEFT JOIN dbo.game g ON gp.game_id = g.id
WHERE g.id IS NULL;

-- Xóa dữ liệu FK
DELETE gp
FROM dbo.game_publisher gp
LEFT JOIN dbo.game g ON gp.game_id = g.id
WHERE g.id IS NULL;

-- Chuẩn hóa text
UPDATE dbo.game
SET game_name = LTRIM(RTRIM(game_name));

-- Viết hoa – viết thường đồng bộ
UPDATE dbo.publisher
SET publisher_name = UPPER(publisher_name);

-- Check & xử lý NULL
SELECT *
FROM dbo.game
WHERE game_name IS NULL;

-- Thay NULL bằng giá trị mặc định
UPDATE dbo.game
SET game_name = 'Unknown'
WHERE game_name IS NULL;

-- Check dữ liệu không hợp lệ
SELECT g.*
FROM dbo.game g
LEFT JOIN dbo.genre ge ON g.genre_id = ge.id
WHERE ge.id IS NULL;
