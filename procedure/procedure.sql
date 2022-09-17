
DELIMITER //

CREATE PROCEDURE insere_dados()
BEGIN 	
	DECLARE erro_sql TINYINT DEFAULT FALSE;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro_sql = TRUE;
START TRANSACTION;
	INSERT INTO produto (id, descricao, preco, estoque) VALUE (4, "bone", 40.10, 3);
	INSERT INTO produto (id, descricao, preco, estoque) VALUE (5, "oculos", 50,35, 12);
    IF erro_sql = FALSE THEN
		COMMIT;
        SELECT 'transição efetivada com sucesso' AS resultado;
	ELSE
			ROLLBACK;
		SELECT 'erro na transação' AS resultado;
    END IF;
END//
DELIMITER ;