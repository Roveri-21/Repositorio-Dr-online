SELECT
cl.idcrm_lead,
cl.ds_titulo,
f_usuario_dados(u.idusuario,'NC') as Usuario, 
cfe.ds_etapa, 
CONCAT('+',cpc.nr_ddi_telefone,'(',cpc.nr_ddd_telefone,')',cpc.nr_telefone) as telefone,
cp.nm_pessoa, 
col.ds_origem,
cl.ds_observacao,
(SELECT
	GROUP_CONCAT(cfm.ds_marcador order by cfm.ds_marcador SEPARATOR ', ')
from
	crm_funil_marcador cfm
where cfm.idcrm_funil_marcador in ((select j.id from json_table(coalesce(cl.idcrm_funil_marcador,'[]'), '$[*]' columns (id int path '$'))j))) as marcador,
(select  GROUP_CONCAT(cp.ds_produto order by cp.ds_produto SEPARATOR ', ')
   from crm_produto cp
   where cp.idcrm_produto in ((select j.id from json_table(coalesce(cl.cd_produto_negociado,'[]'), '$[*]' columns (id int path '$'))j))) as Produto_negociado,
cl.ie_tipo as Tipo_pessoa,
cl.dt_insert as data_criação
FROM
	crm_lead cl 
inner join crm_origem_lead col on
	col.idcrm_origem_lead = cl.idcrm_origem_lead
inner join crm_funil_etapa cfe on
	cfe.idcrm_funil_etapa = cl.idcrm_funil_etapa 
inner join usuario u on
	u.login = cl.login
inner join crm_pessoa cp on
	cp.idcrm_pessoa = cl.idcrm_pessoa
inner join crm_pessoa_contato cpc on
	cpc.idcrm_pessoa = cl.idcrm_pessoa and cpc.ie_principal = 'S'
WHERE
	(JSON_CONTAINS(cl.idcrm_funil_marcador,:idcrm_funil_marcador) or :idcrm_funil_marcador is null)
	and cl.dt_insert BETWEEN :dt_inicial AND :dt_final
	and (f_json_table(:idcrm_funil_etapa, cl.idcrm_funil_etapa) is not null or :idcrm_funil_etapa is null) 
	and cl.idcrm_funil =:idcrm_funil
	and cl.status ='A'
ORDER by ds_etapa DESC;