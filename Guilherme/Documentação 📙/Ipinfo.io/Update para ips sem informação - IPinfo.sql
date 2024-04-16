UPDATE ip_host 
SET ds_city = coalesce(:city, ds_city),
    ds_region = coalesce(:region, ds_region),
    nm_hostname = coalesce(:hostname, nm_hostname),
    ds_country = coalesce(:country, ds_country),
    nm_org = coalesce(:org, nm_org),
    cd_postal  = coalesce(:postal, cd_postal),
    ds_timezone = coalesce(:timezone, ds_timezone),
    loc_longitude = coalesce(SUBSTRING_INDEX(:loc, ',', -1), loc_longitude),
    loc_latitude = coalesce(SUBSTRING_INDEX(:loc, ',', 1), loc_latitude),
    status = IF(:bogon = true,'I','A')
WHERE 
    ip = :ip
    and ip is not null