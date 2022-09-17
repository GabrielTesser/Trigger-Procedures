
DELIMITER //
CREATE TRIGGER trg_venda_item_insert AFTER INSERT ON venda_item FOR EACH ROW
BEGIN
	UPDATE produto SET estoque = estoque - NEW.quantidade WHERE id = id_produto;
END; //

DELIMITER //
create trigger trg_venda_item_delete after delete on venda_item for each row
begin
	update produto set estoque = estoque + old.quantidade where id = id_produto;
end; //