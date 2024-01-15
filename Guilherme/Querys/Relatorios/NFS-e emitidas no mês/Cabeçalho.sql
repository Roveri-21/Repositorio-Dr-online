select
	ue.idestabelecimento,
	e.ds_estabelecimento,
	e.url_logo,
        :mes_ref as mes_ref
from
	usuario u
inner join pessoa_fisica pf on
	pf.idpessoa_fisica = u.idpessoa_fisica
inner join usuario_estab ue on
	u.idusuario = ue.idusuario
inner join estabelecimento e on
	ue.idestabelecimento = e.idestabelecimento
where
	ue.idestabelecimento ={{:idestabelecimento}}
GROUP BY 
	ue.idestabelecimento;