CREATE TABLE message_from(
snd int AUTO_INCREMENT,
fromuser text NOT NULL,
touser text NOT NULL,
message_text text NOT NULL,
time_sent timestamp NOT NULL,
CONSTRAINT PRIMARY KEY(snd)
)
engine=myisam character set utf8 collate=utf8_general_ci;

CREATE TABLE message_sub(
subid int(30) AUTO_INCREMENT,
fromuser text NOT NULL,
touser text NOT NULL,
CONSTRAINT PRIMARY KEY(subid)
)
engine=myisam character set utf8 collate=utf8_general_ci;

CREATE TABLE message_recieve(
snd int(30) AUTO_INCREMENT,
touser text NOT NULL,
fromuser text NOT NULL,
message_text text NOT NULL,
message_count text NOT NULL,
time_sent timestamp NOT NULL,
CONSTRAINT PRIMARY KEY(snd)
)
engine=myisam character set utf8 collate=utf8_general_ci;

DELIMITER //
CREATE PROCEDURE Findmspwd(IN rdr int)
BEGIN
	SELECT * FROM mspwd WHERE ccphone=rdr;
END//

CREATE PROCEDURE Findccuser(IN rdr int)
BEGIN
	SELECT * FROM ccuser WHERE ccphone=rdr;
END//

CREATE PROCEDURE FindMessageRecieved1(IN userto text, IN userfrom text)
BEGIN
	SELECT * FROM message_recieve WHERE touser=userto AND fromuser=userfrom ORDER BY touser DESC;
END//

CREATE PROCEDURE FindMesageReceived2(IN userto text, IN userfrom text) 
BEGIN
	SELECT * FROM message_recieve WHERE touser=userfrom AND fromuser=userto ORDER BY fromuser DESC;
END//

CREATE PROCEDURE FindCountMessags(IN rdr text)
BEGIN
	SELECT message_count FROM message_recieve WHERE touser=rdr;
END//

CREATE PROCEDURE FindPhoto(IN rdr INT)
BEGIN
	SELECT * FROM profilephoto WHERE ccphone=rdr;
END//

CREATE PROCEDURE FindPendingFriends(IN rdr text)
BEGIN
	SELECT * FROM pending_friends_notify WHERE touser=rdr;
END//

CREATE PROCEDURE FindMessageSubTo(IN rdr text)
BEGIN
	SELECT * FROM message_sub WHERE touser=rdr;
END//

CREATE PROCEDURE FindTopMessageTo(IN rdr text)
BEGIN
	SELECT * FROM message_recieve WHERE touser=$rdr LIMIT 1
END//

CREATE PROCEDURE FindMessageSubFrom(IN rdr text)
BEGIN
	SELECT * FROM message_sub WHERE fromuser=rdr;
END//

CREATE PROCEDURE FindTopMessageFrom(IN userfrom)
BEGIN
	SELECT * FROM message_recieve WHERE fromuser=userfrom LIMIT 1
END//

DELIMETER ;
