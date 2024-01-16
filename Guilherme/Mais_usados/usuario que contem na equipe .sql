SELECT
    f_usuario_dados(cem.idusuario,'NC'),
    cem.idusuario 
FROM
    crm_equipe ce
INNER JOIN crm_equipe_membro cem ON
    cem.idcrm_equipe = ce.idcrm_equipe
WHERE
    ce.idcrm_equipe = 2
    AND cem.idusuario NOT IN (
        SELECT cem2.idusuario
        FROM crm_equipe ce2
        INNER JOIN crm_equipe_membro cem2 ON
            cem2.idcrm_equipe = ce2.idcrm_equipe
        WHERE
            ce2.idcrm_equipe = 7
    ) -- diferencia quem esta na equipe 2 mas não esta na equipe 7
ORDER BY cem.idusuario asc;