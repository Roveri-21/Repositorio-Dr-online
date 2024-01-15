select 
  cl.idcrm_lead,
  cl.idcrm_pessoa,
  cl.idcrm_empresa,
  f_replace_emoji(COALESCE(COALESCE(cp2.nm_pessoa,COALESCE(ce.nome_fantasia,ce.ds_razao_social)),cl.ds_titulo)) as ds_titulo,
  DATE_FORMAT(cl.dt_ganho, '%d/%m/%Y') dt_ganho,
  COALESCE(cl.ds_quantidade, 0) ds_quantidade,
  COALESCE(cl.ds_valor, 0) ds_valor
from crm_lead cl    
  inner join crm_funil cf ON cf.idcrm_funil = cl.idcrm_funil 
  inner join crm_projeto cp on cf.idcrm_projeto = cp.idcrm_projeto
  left join crm_pessoa cp2 on cp2.idcrm_pessoa = cl.idcrm_pessoa
  left join crm_empresa ce on ce.idcrm_empresa = cl.idcrm_empresa
where  
  cl.login = :login
  and cp.idestabelecimento = :idestabelecimento
  and cl.idcrm_funil = :idcrm_funil
  and cl.status = 'A'
  and cl.dt_ganho is not null
  and DATE_FORMAT(cl.dt_ganho, '%m/%Y') = DATE_FORMAT(:dt_ref, '%m/%Y') 
order by cl.dt_ganho desc;

-- teste
SELECT
	DATE_FORMAT(clh.dt_ganho, '%d/%m/%Y') dt_ganho
FROM
	crm_lead cl
inner join crm_funil cf ON
	cf.idcrm_funil = cl.idcrm_funil
inner join crm_projeto cp on
	cf.idcrm_projeto = cp.idcrm_projeto
left join crm_pessoa cp2 on
	cp2.idcrm_pessoa = cl.idcrm_pessoa
left join crm_empresa ce on
ce.idcrm_empresa = cl.idcrm_empresa
left join crm_lead_historico clh on clh.idcrm_lead = cl.idcrm_lead and (cl.idcrm_funil_etapa = clh.idcrm_funil_etapa)
where 
	cl.idcrm_lead =403420;


-- data insert

select 
  cl.idcrm_lead,
  cl.idcrm_pessoa,
  cl.idcrm_empresa,
  f_replace_emoji(COALESCE(COALESCE(cp2.nm_pessoa,COALESCE(ce.nome_fantasia,ce.ds_razao_social)),cl.ds_titulo)) as ds_titulo,
  DATE_FORMAT(clh.dt_ganho, '%d/%m/%Y') dt_ganho,
  COALESCE(cl.ds_quantidade, 0) ds_quantidade,
  COALESCE(cl.ds_valor, 0) ds_valor
from crm_lead cl    
  inner join crm_funil cf ON cf.idcrm_funil = cl.idcrm_funil 
  inner join crm_projeto cp on cf.idcrm_projeto = cp.idcrm_projeto
  left join crm_pessoa cp2 on cp2.idcrm_pessoa = cl.idcrm_pessoa
  left join crm_empresa ce on ce.idcrm_empresa = cl.idcrm_empresa
  left join crm_lead_historico clh on clh.idcrm_lead = cl.idcrm_lead and (cl.idcrm_funil_etapa = clh.idcrm_funil_etapa) 
where  
  cl.login = :login
  and cp.idestabelecimento = :idestabelecimento
  and cl.idcrm_funil = :idcrm_funil
  and cl.status = 'A'
  and clh.dt_ganho is not null
  and DATE_FORMAT(clh.dt_ganho , '%m/%Y') = DATE_FORMAT(:dt_ref, '%m/%Y') 
order by cl.dt_ganho desc;

SELECT * from crm_lead cl 
where  cl.idcrm_lead =403420;


select 
  cl.idcrm_lead,
  cl.idcrm_pessoa,
  cl.idcrm_empresa,
  f_replace_emoji(COALESCE(COALESCE(cp2.nm_pessoa,COALESCE(ce.nome_fantasia,ce.ds_razao_social)),cl.ds_titulo)) as ds_titulo,
  DATE_FORMAT(cl.dt_ganho, '%d/%m/%Y') dt_ganho,
  COALESCE(cl.ds_quantidade, 0) ds_quantidade,
  COALESCE(cl.ds_valor, 0) ds_valor
from crm_lead cl    
  inner join crm_funil cf ON cf.idcrm_funil = cl.idcrm_funil 
  inner join crm_projeto cp on cf.idcrm_projeto = cp.idcrm_projeto
  left join crm_pessoa cp2 on cp2.idcrm_pessoa = cl.idcrm_pessoa
  left join crm_empresa ce on ce.idcrm_empresa = cl.idcrm_empresa
  inner join crm_funil_etapa cfe on cfe.idcrm_funil_etapa = cl.idcrm_funil_etapa 
where  
  cl.login = :login
  and cp.idestabelecimento = :idestabelecimento
  and cl.idcrm_funil = :idcrm_funil
  and cl.status = 'A'
  and cl.dt_ganho is not null
  and cfe.idcrm_funil_etapa = 'G'
  and DATE_FORMAT(cl.dt_ganho, '%m/%Y') = DATE_FORMAT(:dt_ref, '%m/%Y')  
order by cl.dt_ganho desc;


-- V202307191739
select   
  crcm.idpessoa_fisica,
  crcm.idpessoa_juridica,
  ap.idestabelecimento,
  1 as idregra_emissao_nfse,
  crcm.vl_transacao as ds_valor,
  ap.idatendimento_paciente
from atendimento_paciente ap
  inner join conta_receber_cartao_movto crcm on ap.idatendimento_paciente = crcm.idatendimento_paciente and ap.idestabelecimento = crcm.idestabelecimento  
where
  DATE_FORMAT(ap.dt_atend_medico, '%m/%Y') = DATE_FORMAT(CURRENT_DATE(), '%m/%Y')  
  and ap.idestabelecimento = :idestabelecimento
  and DATE_FORMAT(crcm.dt_transacao, '%m/%Y') = DATE_FORMAT(CURRENT_DATE(), '%m/%Y')  
  and date(crcm.dt_transacao) <= CURRENT_DATE() - 1  
  and ap.ie_status_atendimento = 'A'  
  and ap.idatend_original is null
  and ap.dt_cancelamento is null
  and ap.dt_fim_consulta is not null
  and crcm.ds_comprovante is not null
  and crcm.nr_autorizacao is not null
  and crcm.dt_cancelamento is null
  and crcm.ie_situacao = 'T'
  and crcm.status = 'A'  
  and not EXISTS (select nf.idatendimento_paciente from nota_fiscal nf where nf.ie_status_envio in ('A', 'E') and nf.status = 'A' and nf.idatendimento_paciente = ap.idatendimento_paciente);


SELECT
	crpm.idpessoa_fisica,
	crpm.idpessoa_juridica,
	crpm.vlr_pix,
	crpm.ie_evento_pix,
	ap.idestabelecimento
from 
	atendimento_paciente ap
inner join pessoa_fisica pf on
	pf.idpessoa_fisica = ap.idpessoa_fisica
inner join conta_receber_pix_movto crpm on
	crpm.idpessoa_fisica = pf.idpessoa_fisica
WHERE 
	crpm.ie_evento_pix = 'B'
	and crpm.ds_endToEnd is not null
	and crpm.dt_cancelamento is not null
	and DATE_FORMAT(ap.dt_atend_medico, '%m/%Y') = DATE_FORMAT(CURRENT_DATE(), '%m/%Y')
	and ap.idestabelecimento = :idestabelecimento
	--    and DATE_FORMAT(crpm.dt_transacao, '%m/%Y') = DATE_FORMAT(CURRENT_DATE(), '%m/%Y')  
	--   and date(crpm.dt_transacao) <= CURRENT_DATE() - 1
	and ap.ie_status_atendimento = 'A'
	and ap.idatend_original is null
	and ap.dt_cancelamento is null
	and ap.dt_fim_consulta is not null
	--   and crpm.ds_comprovante is not null
	--   and crpm.nr_autorizacao is not null
	and crpm.dt_cancelamento is null
	--   and crpm.ie_situacao = 'T'
	and crpm.status = 'A'
    and not EXISTS (select nf.idatendimento_paciente from nota_fiscal nf where nf.ie_status_envio in ('A', 'E') and nf.status = 'A' and nf.idatendimento_paciente = ap.idatendimento_paciente);




 
select
crpm.idpessoa_juridica,
crpm.idpessoa_fisica,
crpm.vlr_baixa as valor_pix,
crpm.ie_evento_pix ='B' as recebido,
crpm.ds_endToEnd  is not null,
crpm.dt_cancelamento is not null,
ap.idestabelecimento,
ap.idatendimento_paciente
from
	conta_receber_pix_movto crpm
inner join titulo_receber tr on
	tr.idtitulo_receber =crpm.idtitulo_receber 
inner join atendimento_paciente ap on
	ap.idatendimento_paciente =tr.idatendimento_paciente;


	



SELECT
    crpm.idpessoa_fisica,
    crpm.idpessoa_juridica,
    crpm.vlr_pix,
    crpm.ie_evento_pix,
    ap.idestabelecimento,
    1 as idregra_emissao_nfse
from 
    atendimento_paciente ap
inner join pessoa_fisica pf on
    pf.idpessoa_fisica = ap.idpessoa_fisica
inner join conta_receber_pix_movto crpm on
    crpm.idpessoa_fisica = pf.idpessoa_fisica
 WHERE 
     crpm.ie_evento_pix = 'B'
     and crpm.ds_endToEnd is not null
     and DATE_FORMAT(ap.dt_atend_medico, '%m/%Y') = DATE_FORMAT(CURRENT_DATE(), '%m/%Y')
     and ap.idestabelecimento = :idestabelecimento
     and ap.ie_status_atendimento = 'A'
     and ap.idatend_original is null
     and ap.dt_cancelamento is null
     and ap.dt_fim_consulta is not null
     and crpm.dt_cancelamento is null
     and crpm.status = 'A'
    and not EXISTS (select nf.idatendimento_paciente from nota_fiscal nf where nf.ie_status_envio in ('A', 'E') and nf.status = 'A' and nf.idatendimento_paciente = ap.idatendimento_paciente);
    
   select 
	sum(total_trabalhada) as total_trabalhada,
	sum(total_outros)     as total_outros,
	sum(total_etapa)	  as total_etapa,
	abs(sum(total_ganhos))	  as total_ganhos,
	sum(total_perca)       as total_perca
from (
select 
  sum(ie_ganho) - 
  (select count(clh2.idcrm_lead_historico)  from crm_lead_historico clh2 
         left join crm_funil_etapa cfe2 on cfe2.idcrm_funil_etapa = clh2.idcrm_funil_etapa 
         where clh2.idcrm_lead = x.idcrm_lead
           and cfe2.ie_tipo_etapa = 'G' and clh2.login_hist = :login)  total_ganhos,
  sum(ie_perda) total_perca,
  sum(ie_criacao) total_criacao,
  sum(ie_outros) total_outros,
  sum(ie_etapa) total_etapa,
  count(distinct idcrm_lead) total_lead,
  count(distinct ie_trabalhada) total_trabalhada
from (select 
  case when coalesce(cfe.ie_tipo_etapa,'') = 'G' and cfe.idcrm_funil_etapa = cl.idcrm_funil_etapa and clh.login_hist = :login then 1 else 0 end ie_ganho,
  case when coalesce(cfe.ie_tipo_etapa,'') = 'P' and clh.login_hist = :login then 1 else 0 end ie_perda,
  case when coalesce(clh.ie_tipo_historico_lead,'') = '0' then 1 else 0 end ie_criacao,
  case when coalesce(clh.ie_tipo_historico_lead,'') = '2' and clh.login_hist  = :login  then 1 else 0 end ie_etapa,
  case when coalesce(clh.ie_tipo_historico_lead,'') not in ('0','14','15','1','2') and clh.login_hist  = :login  then 1 else 0 end ie_outros,
  case when coalesce(clh.ie_tipo_historico_lead,'') <> '0' and clh.login_hist  = :login then clh.idcrm_lead else null end ie_trabalhada,
  clh.idcrm_lead 
from crm_lead_historico clh 
left join crm_lead cl on cl.idcrm_lead = clh.idcrm_lead 
left join crm_funil_etapa cfe on cfe.idcrm_funil_etapa = clh.idcrm_funil_etapa 
where cl.idcrm_funil = :idcrm_funil
  and cl.login = :login
  and cl.status = 'A'
  and DATE(clh.dt_insert) BETWEEN  :dt_inicial  and :dt_final) x ) y;
  
 select 
  sum(ie_ganho) total_ganhos,
  sum(ie_perda) total_perca,
  sum(ie_criacao) total_criacao,
  sum(ie_outros) total_outros,
  sum(ie_etapa) total_etapa,
  count(distinct idcrm_lead) total_lead,
  count(distinct ie_trabalhada) total_trabalhada,
  count(distinct ie_trabalhada_dia_criao) total_trabalhada_dia,
  count(distinct ie_trabalhada_dia_anteriores) total_trabalhada_anterior,
  sum(ie_criacao) - sum(ie_ganho) - sum(ie_perda) + 
    coalesce((select
        sum(case when clh2.ie_tipo_historico_lead = '0' then 1 else 0 end) - 
        sum(case when coalesce(cfe2.ie_tipo_etapa,'') = 'G' and cl2.idcrm_funil_etapa = cfe2.idcrm_funil_etapa then 1 else 0 end) -
        sum(case when coalesce(cfe2.ie_tipo_etapa,'') = 'P' then 1 else 0 end) - 
        (select count(clh.idcrm_lead_historico) - 1 from crm_lead_historico clh 
         left join crm_funil_etapa cfe on cfe.idcrm_funil_etapa = clh.idcrm_funil_etapa 
         where clh.idcrm_lead = clh2.idcrm_lead
           and cfe.ie_tipo_etapa = 'G') - 
        (select count(clh.idcrm_lead_historico) - 1 from crm_lead_historico clh 
         left join crm_funil_etapa cfe on cfe.idcrm_funil_etapa = clh.idcrm_funil_etapa 
         where clh.idcrm_lead = clh2.idcrm_lead
           and cfe.ie_tipo_etapa = 'P')
    from crm_lead_historico clh2 
    left join crm_lead cl2 on cl2.idcrm_lead = clh2.idcrm_lead 
    left join crm_funil_etapa cfe2 on cfe2.idcrm_funil_etapa = clh2.idcrm_funil_etapa
    where date(clh2.dt_insert) < :dt_hist
      and cl2.status = 'A'
      and cl2.login = :login
      and cl2.idcrm_funil = :idcrm_funil
   ),0) saldo_lead
from (select 
  case when coalesce(cfe.ie_tipo_etapa,'') = 'G' and cfe.idcrm_funil_etapa = cl.idcrm_funil_etapa and clh.login_hist = :login then 1 else 0 end ie_ganho,
  case when coalesce(cfe.ie_tipo_etapa,'') = 'P' and clh.login_hist  = :login then 1 else 0 end ie_perda,
  case when coalesce(clh.ie_tipo_historico_lead,'') = '0' then 1 else 0 end ie_criacao,
  case when coalesce(clh.ie_tipo_historico_lead,'') = '2' and clh.login_hist  = :login  then 1 else 0 end ie_etapa,
  case when coalesce(clh.ie_tipo_historico_lead,'') not in ('0','14','15','1','2') and clh.login_hist  = :login  then 1 else 0 end ie_outros,
  case when coalesce(clh.ie_tipo_historico_lead,'') <> '0' and clh.login_hist = :login then clh.idcrm_lead else null end ie_trabalhada,
  case when (coalesce(clh.ie_tipo_historico_lead,'') <> '0') and (clh.login_hist = :login ) and   (Date(cl.dt_insert)  = :dt_hist )   then clh.idcrm_lead else null end ie_trabalhada_dia_criao,
  case when (coalesce(clh.ie_tipo_historico_lead,'') <> '0') and (clh.login_hist = :login ) and   (Date(cl.dt_insert)  <>  :dt_hist )   then clh.idcrm_lead else null end ie_trabalhada_dia_anteriores,
  clh.idcrm_lead 
from crm_lead_historico clh 
left join crm_lead cl on cl.idcrm_lead = clh.idcrm_lead 
left join crm_funil_etapa cfe on cfe.idcrm_funil_etapa = clh.idcrm_funil_etapa 
where cl.idcrm_funil = :idcrm_funil
  and cl.login = :login
  and cl.status = 'A'
  and date(clh.dt_insert) = :dt_hist) x;
  
 
 
 
 
 SELECT
    date_format(dt_hist, '%Y-%m-%d') as dt_hist,
    date_format(dt_hist, '%d/%m/%Y') as data_hist
from (
select 
	 acao
	,dt_hist
	,idcrm_lead as total_lead
	,case when acao = 'Alteração etapas' then
		(count(acao)) 
	end total_etapa
	,case when acao <> 'Alteração etapas' then
		(count(acao)) 
	end total_outros
from (
		select 
		      crm_lead.idcrm_lead 
		      ,crm_lead_historico.idcrm_lead_historico 
			 ,Date(crm_lead_historico.dt_historico) as dt_hist
			 ,case when f_valor_iddominio(614, crm_lead_historico.ie_tipo_historico_lead) = 'Alteração da Etapa'
			       then 'Alteração etapas'
			       else 'outros' end acao
		from crm_lead
			,crm_lead_historico
			,crm_funil_etapa  
		where crm_lead.idcrm_lead = crm_lead_historico.idcrm_lead  
		and crm_funil_etapa.idcrm_funil_etapa = crm_lead.idcrm_funil_etapa
		and crm_funil_etapa.idcrm_funil  = :idcrm_funil
		and crm_lead.login = :login
		and crm_lead.status  = 'A'
		and crm_lead_historico.ie_tipo_historico_lead not in (0,14,15,1)
		and Date(crm_lead_historico.dt_insert) BETWEEN  Date(:dt_inicial) and Date(:dt_final)) h
group by dt_hist, acao, idcrm_lead) p
group by dt_hist
order by  dt_hist;


select 
	sum(total_trabalhada) as total_trabalhada,
	sum(total_outros)     as total_outros,
	sum(total_etapa)	  as total_etapa,
	abs(sum(total_ganhos))	  as total_ganhos,
	sum(total_perca)       as total_perca
from (
select 
  sum(ie_ganho) - 
  (select count(clh2.idcrm_lead_historico)  from crm_lead_historico clh2 
         left join crm_funil_etapa cfe2 on cfe2.idcrm_funil_etapa = clh2.idcrm_funil_etapa 
         where clh2.idcrm_lead = x.idcrm_lead
           and cfe2.ie_tipo_etapa = 'G' and clh2.login_hist = :login)  total_ganhos,
  sum(ie_perda) total_perca,
  sum(ie_criacao) total_criacao,
  sum(ie_outros) total_outros,
  sum(ie_etapa) total_etapa,
  count(distinct idcrm_lead) total_lead,
  count(distinct ie_trabalhada) total_trabalhada
from (select 
  case when coalesce(cfe.ie_tipo_etapa,'') = 'G' and cfe.idcrm_funil_etapa = cl.idcrm_funil_etapa and clh.login_hist = :login then 1 else 0 end ie_ganho,
  case when coalesce(cfe.ie_tipo_etapa,'') = 'P' and clh.login_hist = :login then 1 else 0 end ie_perda,
  case when coalesce(clh.ie_tipo_historico_lead,'') = '0' then 1 else 0 end ie_criacao,
  case when coalesce(clh.ie_tipo_historico_lead,'') = '2' and clh.login_hist  = :login  then 1 else 0 end ie_etapa,
  case when coalesce(clh.ie_tipo_historico_lead,'') not in ('0','14','15','1','2') and clh.login_hist  = :login  then 1 else 0 end ie_outros,
  case when coalesce(clh.ie_tipo_historico_lead,'') <> '0' and clh.login_hist  = :login then clh.idcrm_lead else null end ie_trabalhada,
  clh.idcrm_lead 
from crm_lead_historico clh 
left join crm_lead cl on cl.idcrm_lead = clh.idcrm_lead 
left join crm_funil_etapa cfe on cfe.idcrm_funil_etapa = clh.idcrm_funil_etapa 
where cl.idcrm_funil = :idcrm_funil
  and cl.login = :login
  and cl.status = 'A'
  and DATE(clh.dt_insert) BETWEEN  :dt_inicial  and :dt_final) x ) y;
  select * from chatbot c 
where c.idchatbot = 26;

select 
	acf.idatendimento_chatbot_fila,
	acf.ds_fila
from
	atendimento_chatbot_bot acb
left join atendimento_chatbot_fila acf on
	acf.idatendimento_chatbot = acb.idatendimento_chatbot;

select 
	acf.idatendimento_chatbot_fila as id,
	acf.ds_fila as descricao
from
	atendimento_chatbot_bot acb
left join atendimento_chatbot_fila acf on
	acf.idatendimento_chatbot = acb.idatendimento_chatbot
where
         acb.idchatbot = :idchatbot
	 and acb.status ='A';
 



You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ':idchatbot and acb.status = 'A'' at line 9
 
 select
  acf.idatendimento_chatbot_fila id,
  acf.ds_fila descricao
from atendimento_chatbot_fila acf
inner join atendimento_chatbot ac on ac.idatendimento_chatbot = acf.idatendimento_chatbot
where ac.idestabelecimento = {{:idestabelecimento}}
  and acf.status = 'A'
  and exists(select * from chatbot c
             where c.idchatbot = :idchatbot
               and c.idatendimento_chat = ac.idatendimento_chatbot
               and c.status = 'A')
order by acf.ds_fila




select distinct
  acfu.idusuario id,
  pf.nm_pessoa descricao
from atendimento_chatbot_fila_usuario acfu 
inner join atendimento_chatbot_fila acf on acf.idatendimento_chatbot_fila = acfu.idatendimento_chatbot_fila 
inner join atendimento_chatbot ac on ac.idatendimento_chatbot = acf.idatendimento_chatbot 
inner join usuario u on u.idusuario = acfu.idusuario 
inner join pessoa_fisica pf on pf.idpessoa_fisica = u.idpessoa_fisica 
where ac.idestabelecimento = :idestabelecimento
  and exists(select * from chatbot c
             where c.idchatbot = :idchatbot
               and c.idatendimento_chat = ac.idatendimento_chatbot
               and c.status = 'A')
order by pf.nm_pessoa;


call p_pivot_dynamic_qtd_lead_etapa_por_origem


CREATE DEFINER=`apirest`@`%` PROCEDURE `homologacao`.`p_pivot_dynamic_qtd_lead_etapa_por_origem_criacao`(IN idestabelecimento int, in idcrm_funil int, in dt_inicial date, in dt_final date)
BEGIN
  SET @sql = (SELECT GROUP_CONCAT(DISTINCT
                                  CONCAT(
                                    'SUM(CASE WHEN x.status = "A" and x.idcrm_funil_etapa = ',
                                    x.idcrm_funil_etapa,
                                    ' THEN 1 ELSE 0 END) AS etapa_',
                                    x.row_num
                                  )
                                order by x.row_num)
                                                 
              FROM (select cfe.idcrm_funil_etapa,
					  ROW_NUMBER() OVER (ORDER by cfe.nr_sequencia) row_num
					  from crm_funil_etapa cfe
					  WHERE cfe.status = 'A' 
					    and cfe.idcrm_funil = idcrm_funil
					  order by cfe.nr_sequencia limit 9) x);
             
   SET @sql = CONCAT('SELECT col.idcrm_origem_lead, col.ds_origem,', @sql, ', COUNT(x.idcrm_origem_lead) AS total
                     FROM crm_projeto cp
						  inner join crm_funil cf on cp.idcrm_projeto = cf.idcrm_projeto
						  inner join crm_lead x on x.idcrm_funil = cf.idcrm_funil
						  inner join (select * from crm_funil_etapa cfe where cfe.status = "A" and cfe.idcrm_funil = ', idcrm_funil, ' order by cfe.nr_sequencia limit 9) cfe on x.idcrm_funil_etapa = cfe.idcrm_funil_etapa 
						  inner join crm_origem_lead col on x.idcrm_origem_lead = col.idcrm_origem_lead
                     WHERE 
                         cp.idestabelecimento = ', idestabelecimento, '
						 and x.idcrm_funil = ', idcrm_funil, '
						 and x.status = ''', 'A', '''
						 and date(x.dt_insert) BETWEEN ''', dt_inicial, ''' and ''', dt_final, '''
                     GROUP BY col.idcrm_origem_lead, col.ds_origem');

  PREPARE stmt FROM @sql;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;                           
END





CALL p_pivot_dynamic_qtd_lead_etapa_por_origem_criacao;



Problema ao processar query da banda 'Dados'! PROCEDURE homologacao.p_pivot_dynamic_qtd_lead_etapa_por_origem_criacao does not exist PROCEDURE homologacao.p_pivot_dynamic_qtd_lead_etapa_por_origem_criacao does not exist at Packet.asError (/root/sistemas/apirest/node_modules/mysql2/lib/packets/packet.js:728:17) at Query.execute (/root/sistemas/apirest/node_modules/mysql2/lib/commands/command.js:29:26) at PoolConnection.handlePacket (/root/sistemas/apirest/node_modules/mysql2/lib/connection.js:478:34) at PacketParser.onPacket (/root/sistemas/apirest/node_modules/mysql2/lib/connection.js:97:12) at PacketParser.executeStart (/root/sistemas/apirest/node_modules/mysql2/lib/packet_parser.js:75:16) at Socket. (/root/sistemas/apirest/node_modules/mysql2/lib/connection.js:104:25) at Socket.emit (node:events:513:28) at addChunk (node:internal/streams/readable:315:12) at readableAddChunk (node:internal/streams/readable:289:9) at Socket.Readable.push (node:internal/streams/readable:228:10) at TCP.onStreamRead (node:internal/stream_base_commons:190:23)

select
	apa.idatendimento_paciente,
	pf.nm_pessoa,
	DATE_FORMAT(ap.dt_atend_medico, '%d/%m/%Y %H:%i') dt_atendimento,
	e.ds_especialidade,
	apa.nr_estrela,
	pf2.nm_pessoa nm_medico,
	f_replace_emoji( SUBSTRING(concat('Comentario: ' ,(REPLACE(REPLACE(apa.ds_opiniao, char(13), ' '), char(10), ' '))),1,255)) ds_opiniao,
	pfc.ds_municipio,
	pfc.sg_uf
from
	atendimento_paciente_avaliacao apa
inner join atendimento_paciente ap on
	ap.idatendimento_paciente = apa.idatendimento_paciente
inner join pessoa_fisica pf on
	pf.idpessoa_fisica = ap.idpessoa_fisica
inner join pessoa_fisica_compl pfc on
	pfc.idpessoa_fisica = pf.idpessoa_fisica
	and pfc.ie_tipo_complemento = '1'
inner join especialidade e on
	e.idespecialidade = ap.idespecialidade
inner join pessoa_fisica pf2 on
	pf2.idpessoa_fisica = ap.idmedico_atendimento
where
	date(ap.dt_atend_medico) between :dt_inicial and :dt_final
	and ap.idestabelecimento = :idestabelecimento
order by
	ap.dt_atend_medico desc,
	apa.idatendimento_paciente_avaliacao desc;
	
Marcador em uso, remova da tag de encerramento automatico antes de inativar!

SELECT SUBSTRING('Olá, foi minha primeira consulta com vocês. Pra ser sincera achei um pouco abaixo da média o atendimento. Senti um pouco de pressa no atendimento, falei alguns questionamentos, mas não tive retorno. Enfim, vou marcar o retorno pra mostrar os exames de rotina, mas não marcaria novamente. Talvez tentaria outro médico.',1,255) as id;
