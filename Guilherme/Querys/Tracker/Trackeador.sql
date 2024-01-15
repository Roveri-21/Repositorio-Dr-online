SELECT * FROM trackeador_acao ta 
order by 
ta.idtrackeador_acao DESC;

-- validação de acesso no site, caso seja necessario validar em algum site basta executar e esperar 10 segundos.


SELECT * from trackeador_acao ta
inner join trackeador_usuario tu on tu.idtrackeador_usuario = ta.idtrackeador_usuario and tu.idtrackeador = 12 -- altere o codigo do trackeador para acompanhar as novas requisições no site
WHERE ta.dados is not NULL 
order by ta.idtrackeador_acao  DESC;

