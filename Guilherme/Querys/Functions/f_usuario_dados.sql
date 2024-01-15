CREATE DEFINER=`apirest`@`%` FUNCTION `homologacao`.`f_usuario_dados`(u_idusuario bigint(20), u_opcao char(3)) RETURNS varchar(255) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
BEGIN
	declare v_result varchar(255) default null;

/*
 * OPÇÃO
 * LG => Login Usuario
 * NC => Nome completo
 */

if(u_opcao = 'LG')then 
	SELECT
		login
		into v_result
	from
		usuario u
	WHERE idusuario = u_idusuario;
end if;

if (u_opcao = 'NC') then
	SELECT 
		pf.nm_pessoa
		into v_result
	FROM usuario u 
	inner join pessoa_fisica pf on
	pf.idpessoa_fisica =u.idpessoa_fisica 
	WHERE idusuario =u_idusuario;
end if;


return (v_result);


END