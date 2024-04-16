SELECT
	ih.ip 
FROM
	ip_host ih
WHERE
	ih.ds_city is null 
	and nm_hostname is NULL 
	and ds_country is null 
	and nm_org is null 
	and loc_longitude is null 
	and cd_postal is NULL 
	and ih.loc_latitude is null 
	and ds_region is null 
	and status = 'A'
order by
	idip_host asc
limit 1;