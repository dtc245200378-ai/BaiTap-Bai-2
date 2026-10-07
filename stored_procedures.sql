USE demo;

-- 1. Procedure hiển thị tất cả users
DELIMITER //
DROP PROCEDURE IF EXISTS select_all_users//
CREATE PROCEDURE select_all_users()
BEGIN
    SELECT * FROM users;
END //
DELIMITER ;

-- 2. Procedure cập nhật thông tin user
DELIMITER //
DROP PROCEDURE IF EXISTS update_user//
CREATE PROCEDURE update_user(
    IN user_id INT,
    IN user_name VARCHAR(250),
    IN user_email VARCHAR(250),
    IN user_country VARCHAR(250)
)
BEGIN
    UPDATE users 
    SET name = user_name, email = user_email, country = user_country 
    WHERE id = user_id;
END //
DELIMITER ;

-- 3. Procedure xóa user
DELIMITER //
DROP PROCEDURE IF EXISTS delete_user//
CREATE PROCEDURE delete_user(
    IN user_id INT
)
BEGIN
    DELETE FROM users WHERE id = user_id;
END //
DELIMITER ;
