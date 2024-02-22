UPDATE chat_atendimento  -- update de marcador
SET tags_atendimento = JSON_ARRAY_APPEND(COALESCE(tags_atendimento, '[]'), '$',:id_marcador)
WHERE idchat_atendimento = :idchat_atendimento_corrente
and :id_marcador is not null;