SELECT
	r.idrelatorio,
	r.ds_titulo 
from relatorio r 
inner join 	relatorio_usuario ru on
	ru.idrelatorio = r.idrelatorio 
inner join usuario u on 
	u.login = ru.login_usuario
WHERE 
	ru.idestabelecimento = 8
	and u.idusuario  = 99
ORDER BY r.idrelatorio asc;