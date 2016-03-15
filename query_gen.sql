-- (Replace [your_magento_database] with your database name)-- 
-- run the following code into phpmyadmin sql tab INSIDE your db-- 

SELECT CONCAT('DROP TABLE `',t.table_schema,'`.`',t.table_name,'`;') AS stmt
FROM information_schema.tables t
WHERE t.table_schema = '[your_magento_database]'
AND t.table_name LIKE 'perception%' ESCAPE '\\'
ORDER BY t.table_name;

SELECT CONCAT('TRUNCATE TABLE `',t.table_schema,'`.`',t.table_name,'`;') AS stmt
FROM information_schema.tables t
WHERE t.table_schema = '[your_magento_database]'
AND t.table_name LIKE 'perception%' ESCAPE '\\'
ORDER BY t.table_name;

-- copy the generated statements and run them in phpmyadmin-- 

-- run the following code into phpmyadmin sql tab INSIDE your db-- 

SELECT CONCAT('ALTER TABLE `',TABLE_SCHEMA,'`.`',TABLE_NAME,'` DROP `',COLUMN_NAME,'`;') AS stmt
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME LIKE "perception%"
AND TABLE_SCHEMA='[your_magento_database]';

-- copy the generated statements and run them in phpmyadmin-- 
