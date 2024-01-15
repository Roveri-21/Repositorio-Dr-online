select
	DISTINCT
DATE_FORMAT(crcm.dt_transacao, '%d/%m/%Y %H:%i') dt_pagamento,
	t.idtm_usuario,
	pf.idpessoa_fisica,
	pf.nm_pessoa,
	pfc.nr_endereco,
	pfc.cep,
	if(l.cep,
	'OK',
	'SEM CEP') ds_cep_sistema,
	pf.nr_cpf,
	DATE_FORMAT(pf.dt_nascimento, '%d/%m/%Y') dt_nascimento,
	crcm.idatendimento_paciente,
	(
          select GROUP_CONCAT(nf.nr_nota_fiscal separator ', ') 
          from nota_fiscal nf
          where ((nf.idatendimento_paciente = crcm.idatendimento_paciente) or
                (((nf.idpessoa_fisica = crcm.idpessoa_fisica) and(nf.idatendimento_paciente is null) or ((nf.idpessoa_juridica = crcm.idpessoa_juridica)and nf.idatendimento_paciente is null)) and 
                  (nf.dt_emissao >= crcm.dt_transacao) and (nf.vl_total_nota = crcm.vl_transacao)))
              and nf.cd_verificacao_nfse is not null
              and nf.dt_cancelamento is null
              and nf.ie_status_envio = 'A'
              and nf.status = 'A'
        ) nr_nota_fiscal
from
	conta_receber_cartao_movto crcm
inner join pessoa_fisica pf on
	pf.idpessoa_fisica = crcm.idpessoa_fisica
left join tm_usuario t on
	t.idpessoa_fisica = pf.idpessoa_fisica
inner join pessoa_fisica_compl pfc on
	crcm.idpessoa_fisica = pfc.idpessoa_fisica
	and pfc.ie_tipo_complemento = '1'
left join logradouro l on
	pfc.cep = l.cep
where
	date(crcm.dt_transacao) BETWEEN :dt_inicial and :dt_final
	and crcm.ie_situacao = 'T'
        and crcm.dt_cancelamento is null
	and crcm.idestabelecimento = {{:idestabelecimento}}
order by
	crcm.dt_transacao desc;