SELECT * from usuario u 
inner join pessoa_fisica pf on pf.idpessoa_fisica =u.idpessoa_fisica
inner join usuario_estab ue on u.idusuario = ue.idusuario 
where u.idusuario = 254 -- codigo do usuario
order by u.idusuario desc;