SELECT DISTINCT
     tac.nr_cartao_ps as id,
     tac.nm_paciente as descricao
 FROM 
     tmp_agenda_cohp tac
    order by nm_paciente asc;
   
   --
SELECT DISTINCT 
     tac.nr_crm as id,
     tac.nm_medico as descricao
 FROM 
     tmp_agenda_cohp tac
    order by nm_medico asc; 
 

SELECT DISTINCT 
     tac.cd_procedimento as id,
     tac.ds_procedimento as descricao
 FROM 
     tmp_agenda_cohp tac
    order by ds_procedimento asc;
