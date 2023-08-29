select 
  u.idusuario,
  u.login,
  u.idpessoa_fisica,
  pf.nm_pessoa
from usuario u
inner join usuario_estab ue on ue.idusuario = u.idusuario and ue.idestabelecimento = 2
inner join pessoa_fisica pf on pf.idpessoa_fisica = u.idpessoa_fisica
where
  u.status <> 'A';