SELECT * FROM trackeador_acao ta 
order by 
ta.idtrackeador_acao DESC;

-- validação de acesso no site, caso seja necessario validar em algum site basta executar e esperar 10 segundos.


SELECT * from trackeador_acao ta
inner join trackeador_usuario tu on tu.idtrackeador_usuario = ta.idtrackeador_usuario and tu.idtrackeador = 12 -- altere o codigo do trackeador para acompanhar as novas requisições no site
WHERE ta.dados is not NULL -- pega somente os formularios preenchidos
order by ta.idtrackeador_acao  DESC;





function x () { if (('$[sessao_gclid]$' || '$[sessao_gbraid]$' || '$[sessao_wbraid]$')&&'$[post_id]$'=="1831") return 328;if ('$[sessao_gclid]$' || '$[sessao_gbraid]$' || '$[sessao_wbraid]$') return 327;if (('$[sessao_fbclid]$') &&'$[post_id]$'=="1831")return 324;if ('$[sessao_fbclid]$')return 323; if '$[post_id]$'=="1831" return 326;return 325;}