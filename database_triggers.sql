DELIMITER //
CREATE TRIGGER update_timeliness 
AFTER INSERT ON rating 
FOR EACH ROW BEGIN
UPDATE Customer_info
SET Customer_info.timeliness = (
SELECT ROUND(AVG(rating.timeliness),2) FROM rating WHERE rating.rated_id = (
SELECT rating.rated_id FROM rating WHERE rating.id = (SELECT MAX(rating.id) FROM rating))
GROUP BY rating.rated_id)
WHERE Customer_info.id = (SELECT rating.rated_id FROM rating WHERE rating.id = (SELECT MAX(rating.id) FROM rating));
END//

CREATE TRIGGER update_item_handling
AFTER INSERT ON rating
FOR EACH ROW BEGIN
UPDATE Customer_info
SET Customer_info.item_handling = (
SELECT ROUND(AVG(rating.item_handling),2) FROM rating WHERE rating.rated_id = (
SELECT rating.rated_id FROM rating WHERE rating.id = (SELECT MAX(rating.id) FROM rating))
GROUP BY rating.rated_id)
WHERE Customer_info.id = (SELECT rating.rated_id FROM rating WHERE rating.id = (SELECT MAX(rating.id) FROM rating));
END//

CREATE TRIGGER update_successfully_fulfilled
AFTER UPDATE ON Request_list
FOR EACH ROW BEGIN
UPDATE Customer_info
SET Customer_info.successfully_fulfilled = (
SELECT COUNT(CASE WHEN Request_list.request_status = 'Finished' THEN 1 END) FROM Request_list WHERE Request_list.Proxy_id = (
SELECT Request_list.Proxy_id FROM Request_list ORDER BY Request_list.completion_time DESC LIMIT 1) GROUP BY Request_list.Proxy_id)
WHERE Customer_info.id = (SELECT Request_list.Proxy_id FROM Request_list ORDER BY Request_list.completion_time DESC LIMIT 1); 
END//

CREATE TRIGGER update_transaction_id
AFTER INSERT ON Transaction_list
FOR EACH ROW BEGIN
UPDATE Request_list
SET Request_list.transaction_id = (
SELECT Transaction_list.id FROM Transaction_list ORDER BY Transaction_list.id DESC LIMIT 1)
WHERE Request_list.id = (SELECT Transaction_list.request_id FROM Transaction_list ORDER BY Transaction_list.id DESC LIMIT 1);
END//

CREATE TRIGGER update_request_stat
AFTER UPDATE ON Transaction_list
FOR EACH ROW BEGIN
IF (SELECT Transaction_list.settlement_status FROM Transaction_list ORDER BY Transaction_list.last_update_time DESC LIMIT 1) = 'Done' THEN
UPDATE Request_list
SET Request_list.request_status = 'Finished' WHERE Request_list.id = (SELECT Transaction_list.request_id FROM Transaction_list ORDER BY Transaction_list.last_update_time DESC LIMIT 1);
END IF;
END//     

