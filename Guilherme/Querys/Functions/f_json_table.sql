-- para adiciona a função f_jason devemos utilizar os seguinte parametros 
"[\"98\", \"1\"]" -- as barras \ farão o dbever esquecer [] chave de forma que ele possa executar mais de 1 parametro para a condição
-- lembrando que para usar essa função devemos utilizar o in em uma condição wherer

"[\"98\"]"

--exemplo
	select
	DISTINCT
		p.idpessoa_fisica p_idpessoa,
		upper(f_profissional_dados(p.idprofissional , 'NC')) nome,
		CONCAT(f_profissional_dados(p.idprofissional, 'SCP'), ': ', f_profissional_dados(p.idprofissional, 'NCP'), ' - ', f_profissional_dados(p.idprofissional, 'UF')) conselho
from
	atendimento_paciente ap
inner join classificacao_atendimento ca on
	ca.idclassificacao_atendimento = ap.idclassificacao
inner join profissional p on
	p.idpessoa_fisica = ap.idmedico_atendimento
	and p.idestab_orig = ap.idestabelecimento
where
	DATE_FORMAT(dt_inicio_atendimento, '%Y-%m-%d') BETWEEN :dt_inicio and COALESCE(:dt_fim, CURRENT_DATE())
	and(ap.ie_status_atendimento in(f_json_table(:status,ap.ie_status_atendimento))or :status is NULL);
	
-- use o seguinte parametro em status = "[\"C\",\"A\"]"



--- para pegar um valo que foi armazenado como json e assim
(select  GROUP_CONCAT(cp.ds_produto order by cp.ds_produto SEPARATOR ', ') -- deve ser feito um select onde contem a descrição de fato 
   from crm_produto cp
   where cp.idcrm_produto in ((select j.id from json_table(coalesce(cl.cd_produto_ganho,'[]'), '$[*]' columns (id int path '$'))j))) as ds_produto_ganho -- em seguida deve
   -- ser feita a criação dessa query, onde o campo que contem o json vai ser informado

   