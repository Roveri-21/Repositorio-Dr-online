CREATE FUNCTION `homologacao`.`f_extrair_numero_telefone`(
    numero_completo VARCHAR(20),
    u_opcao VARCHAR(3)
) RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE resultado VARCHAR(20);
	DECLARE conteudo VARCHAR(20);
    IF (numero_completo IS NULL OR numero_completo = '') THEN
        RETURN 'Número inválido';
    END IF;

    IF LENGTH(numero_completo) >= 12 THEN
        -- Se o número tem 12 ou mais caracteres, considera que tem DDI e DD.
        IF (u_opcao = 'DDI') THEN
            SET resultado = SUBSTRING(numero_completo, 1, 2);
        ELSEIF (u_opcao = 'DD') THEN
            SET resultado = SUBSTRING(numero_completo, 3, 2);
        ELSEIF (u_opcao = 'NM') THEN
            SET resultado = RIGHT(numero_completo, 9);
        END IF;
        IF (u_opcao = 'NM8') THEN
            SET resultado = RIGHT(numero_completo, 8);
        END IF;
    ELSEIF LENGTH(numero_completo) BETWEEN 10 AND 11 THEN
        -- Se o número tem 10 ou 11 caracteres, considera que tem DD.
        IF (u_opcao = 'DD') THEN
            SET resultado = SUBSTRING(numero_completo, 1, 2);
        ELSEIF (u_opcao = 'NM') THEN
            SET resultado = RIGHT(numero_completo, 9);
        END IF;
       IF (u_opcao = 'NM8') THEN
            SET resultado = RIGHT(numero_completo, 8);
        END IF;
    ELSEIF LENGTH(numero_completo) = 9 THEN
        -- Se o número tem 9 caracteres, considera que tem apenas NM.
        IF (u_opcao = 'NM') THEN
            SET resultado = RIGHT(numero_completo, 9);
        END IF;
       IF (u_opcao = 'NM8') THEN
            SET resultado = RIGHT(numero_completo, 8);
        END IF;
    ELSEIF LENGTH(numero_completo) = 8 THEN
        -- Se o número tem 8 caracteres, considera que tem apenas NM.
        IF (u_opcao = 'NM8') THEN
            SET resultado = RIGHT(numero_completo, 8);
        END IF;
    END IF;

    RETURN resultado;
END;