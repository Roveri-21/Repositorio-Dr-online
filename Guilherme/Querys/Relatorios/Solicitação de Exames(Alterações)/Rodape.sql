select 
  med.nm_pessoa nome_medico, 
  pon.nr_conselho crm,
  pon.uf_conselho uf_medico,	
  es.ds_estabelecimento nm_est,	
  concat(l.ds_logradouro) endereco,
  b.ds_bairro bairro,
  m.ds_municipio municipio,
  m.sg_uf uf,
  concat('(', nr_ddd_telefone, ') ', nr_telefone) telefone,
  concat('Assinado de forma digital por: ', med.nm_pessoa, ' Dados: ',DATE_FORMAT(COALESCE(a.dt_liberacao), '%d/%m/%Y %H:%i:%s '), @@system_time_zone,' 00') msg_assinatura,
  (select max(url_arquivo) from pessoa_fisica_anexo p where p.idpessoa_fisica = med.idpessoa_fisica and p.ie_tipo_anexo = 1) url_anexo_assinatura,
  DATE_FORMAT(a.dt_liberacao, '%d/%m/%Y') dt_emissao,
	esp.ds_especialidade,
  pe.nr_rqe
from empresa e 
	inner join estabelecimento es on es.idempresa = e.idempresa and es.idestabelecimento = 1
	inner join pessoa_juridica pj on pj.cnpj = e.cnpj 
	inner join logradouro l on l.cep = es.cep
	inner join bairro b on b.idbairro = l.idbairro
	inner join municipio m on m.idmunicipio = l.idmunicipio,
	atendimento_pedido_exame_exter a
	inner join pessoa_fisica pf on pf.idpessoa_fisica = a.idpessoa_fisica
	inner join pessoa_fisica med on med.idpessoa_fisica = a.idmedico
	inner join profissional pon on pon.idpessoa_fisica = med.idpessoa_fisica
	inner join atendimento_paciente ap on ap.idatendimento_paciente = a.idatendimento
    left join especialidade esp on esp.idespecialidade = ap.idespecialidade 
	left join profissional_especialidade pe on pe.idprofissional = pon.idprofissional and pe.idespecialidade = esp.idespecialidade
where e.idempresa = 1
and a.idatendimento_pedido_exame = :idatendimento_pedido_exame
and ap.idestabelecimento = pon.idestab_orig
and a.status in ('L','A'); -- <<< alteração do campo status de and a.status ='L' 