DELIMITER //
CREATE FUNCTION `dados`.`f_extrair_numero_telefone`(
    numero_completo VARCHAR(20),
    u_opcao VARCHAR(3)
) RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
COMMENT 'função que retorna ddd, ddi, numero com ou sem o nove do whatsapp'
BEGIN
	/*
  * Autoria: Guilherme Roveri
  * Data: 29/01/2024
  * 
  * u_opcao 
  *    Opções: DDI,DDD,NR ou NR8
  *    Quando "DDI" for selecionado,retornará apenas o ddi do numero.
  *    Quando "DDD" for selecionado,retornará apenas o ddd do numero.	
  *    Quando "NR" for selecionado,retornará apenas o numero com o digito nove caso exista. 
  *    Quando "NR8" for selecionado,retornará apenas o numero sem o digito nove.
	 */
	DECLARE ddi VARCHAR(2);
    DECLARE ddd VARCHAR(2);
    DECLARE nr VARCHAR(9);       
	DECLARE conteudo VARCHAR(20);

    set conteudo = numero_completo;     

    IF (numero_completo IS NULL OR numero_completo = '') THEN
        RETURN 'Número inválido';
    END IF;

    IF LENGTH(conteudo) >= 12 THEN
        -- Se o número tem 12 ou mais caracteres, considera que tem DDI e DD.
        SET ddi = SUBSTRING(conteudo, 1, 2);
        SET conteudo = RIGHT(conteudo, LENGTH(conteudo) - 2); 
    END IF;
   
   IF LENGTH(conteudo) BETWEEN 10 AND 11 THEN
        -- Se o número tem 10 ou 11 caracteres, considera que tem DD.
        SET ddd = SUBSTRING(conteudo, 1, 2);
        SET conteudo = RIGHT(conteudo, LENGTH(conteudo) - 2); 
    END IF;
   
   IF LENGTH(conteudo) <= 9 THEN
--         Se o número tem 9 ou menos caracteres, e apenas o numero do contato
        SET nr = RIGHT(conteudo, LENGTH(conteudo));                
     END IF;
   
    RETURN CASE
	    WHEN upper(u_opcao) = 'DDI' THEN ddi
	    WHEN upper(u_opcao) = 'DDD' THEN ddd
        WHEN upper(u_opcao) = 'NR' THEN nr
        WHEN upper(u_opcao) = 'NR8' THEN RIGHT(nr, 8)
        ELSE NULL
     END;
END;

DELIMITER ;