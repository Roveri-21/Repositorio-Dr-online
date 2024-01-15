select e.idestabelecimento, e.ds_estabelecimento, DATE_FORMAT(:dt_ref, '%m/%Y') dt_ref, e.url_logo from estabelecimento e
where  
  e.idestabelecimento = {{:idestabelecimento}};