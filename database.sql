CREATE DATABASE 24h_international_delivery;
CREATE TABLE Customer_info(
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR (100),
    last_name VARCHAR (100),
    country VARCHAR (100),
    gender VARCHAR (6) CHECK (gender in ('Male','Female','Others')),
    date_of_birth DATE,
    timeliness DECIMAL (2,2) DEFAULT NULL,
    item_handling DECIMAL (2,2) DEFAULT NULL,
    arbitrarily_cancel INT DEFAULT NULL,
    successfully_fulfilled INT DEFAULT NULL,
    username VARCHAR(10) UNIQUE,
    user_password VARCHAR(10) UNIQUE,
    email VARCHAR(30) UNIQUE,
    Mobile_number VARCHAR(15));

CREATE TABLE Request_list(
    id INT PRIMARY KEY AUTO_INCREMENT,
    Requester_id INT,
    Proxy_id INT,
    transaction_id INT,
    request_origin VARCHAR(10) CHECK (request_origin in ('VN','USA','UK','JAP')),
    request_destination VARCHAR(10) CHECK (request_destination in ('VN','USA','UK','JAP')),
    request_status VARCHAR(10) DEFAULT 'Not Finished' CHECK (request_status in ('Not Finished','Finished')),
    content VARCHAR(1000),
    completion_time TIMESTAMP,
    FOREIGN KEY (Proxy_id) REFERENCES Customer_info(id) ON DELETE SET NULL,
    FOREIGN KEY (Requester_id) REFERENCES Customer_info(id) ON DELETE SET NULL,
    FOREIGN KEY (transaction_id) REFERENCES Transaction_list(id) ON DELETE SET NULL
);

CREATE TABLE Transaction_list(
    id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(8,4),
    settlement_status VARCHAR(20) CHECK (settlement_status in ('Not Received','Received','Done')) DEFAULT 'Not Received',
    request_id INT,
    Payer_id INT,
    Recipient_id INT,
    last_update_time TIME,
    FOREIGN KEY (request_id) REFERENCES Request_list(id) ON DELETE SET NULL,
    FOREIGN KEY (Payer_id) REFERENCES Customer_info(id) ON DELETE SET NULL,
    FOREIGN KEY (Recipient_id) REFERENCES Customer_info(id) ON DELETE SET NULL);

CREATE TABLE Comment(
    id INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR (100),
    request_id INT,
    commenter_id INT,
    create_time TIMESTAMP,
    FOREIGN KEY (request_id) REFERENCES Request_list(id) ON DELETE SET NULL,
    FOREIGN KEY (commenter_id) REFERENCES Customer_info(id) ON DELETE SET NULL);

CREATE TABLE rating(
    id INT PRIMARY KEY AUTO_INCREMENT,
    rated_id INT,
    rater_id INT,
    timeliness DECIMAL (4,2),
    item_handling DECIMAL (4,2),
    FOREIGN KEY (rater_id) REFERENCES Customer_info(id) ON DELETE SET NULL,
    FOREIGN KEY (rated_id) REFERENCES Customer_info(id) ON DELETE SET NULL);

    


   
