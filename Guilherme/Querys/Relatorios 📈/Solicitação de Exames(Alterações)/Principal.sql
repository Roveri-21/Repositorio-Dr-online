-- Principal
select distinct	 
		p.nm_pessoa nm_paciente,
                if(p.nr_cpf, p.nr_cpf, if(p.nr_identidade, concat(p.nr_identidade, '-', p.ds_orgao_emissor_ci), if(p.nr_cert_nasc, p.nr_cert_nasc, ''))) documento,
if(p.nr_cpf, 'CPF:', if(p.nr_identidade, 'RG:', if(p.nr_cert_nasc,'Cert. Nasc.:', 'Documento:'))) lbldocumento,
		COALESCE(concat(ad.cd_doenca, ' - ', cd.ds_doenca_cid),' ') cid		
from atendimento_pedido_exame_exter a
		inner join pessoa_fisica p on p.idpessoa_fisica = a.idpessoa_fisica
		inner join profissional pr on pr.idpessoa_fisica = a.idmedico
		inner join atendimento_paciente ap on ap.idatendimento_paciente = a.idatendimento
		left join atendimento_diagnostico_doenca ad on ad.idatendimento = ap.idatendimento_paciente  and ad.ie_tipo_diagnostico = 1 and ad.status in ('A','L')  -- <<< alteração do campo status de and a.status ='L' 
		left join cid_doenca cd on cd.cd_cid_doenca = ad.cd_doenca 
where idatendimento_pedido_exame = :idatendimento_pedido_exame
and ap.idestabelecimento = pr.idestab_orig
limit 1;