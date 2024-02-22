SELECT
	tu.idtm_usuario as Cod_Usuario,
	pf.nm_pessoa as Nome_Titular,
	(SELECT f_pessoa_fisica_dados(tugf.idpessoa_fisica,'NC') FROM tm_usuario_grupo_familiar tugf   WHERE tugf.idtm_usuario = tu.idtm_usuario limit 1 ) as Dependente,
	vg.idvoucher_gerados as Id_Voucher, 
	vg.cd_voucher as Voucher,
	vg.dt_baixa as Data_Uso,
	crcm.idatendimento_paciente as Id_Atendimento
FROM
	voucher_gerados vg
inner join pessoa_fisica pf on
	pf.idpessoa_fisica = vg.idpessoa_fisica_uso 
INNER JOIN caixa_recebimento cr on
	cr.idvoucher  = vg.idvoucher_gerados 
INNER JOIN conta_receber_cartao_movto crcm on
	crcm.idcaixa_recebimento =cr.idcaixa_recebimento 
INNER JOIN tm_usuario tu on
	tu.idpessoa_fisica = pf.idpessoa_fisica 
WHERE 
	vg.ie_status_voucher ='B' -- voucher ja utilizado 
	and vg.idvoucher_regra = :idvoucher_regra -- informe o id da regra
	and DATE_FORMAT(vg.dt_insert, '%m/%Y') = DATE_FORMAT(:dt_ref, '%m/%Y') 
order by
	vg.idvoucher_gerados DESC;