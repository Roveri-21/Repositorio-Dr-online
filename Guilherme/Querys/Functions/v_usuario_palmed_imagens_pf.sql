-- para criar uma view
create view v_usuario_palmed_imagens_pf as select u.cd_usuario, u.idpessoa_fisica, pf.nm_pessoa, pf.nr_cpf, CONCAT('http://api.drmais.com.br/', 'public/pessoa_fisica/', u.idpessoa_fisica, '.png?', UNIX_TIMESTAMP(CURRENT_TIMESTAMP())) url_img from usuario_estab ue
  inner join usuario u on u.idusuario = ue.idusuario   
  inner join pessoa_fisica pf on pf.idpessoa_fisica = u.idpessoa_fisica 
where
  ue.idestabelecimento = 5
  and u.cd_usuario is not null 
order by u.cd_usuario;


--para chamar a view
select * from v_usuario_palmed_imagens_pf;