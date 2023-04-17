   
SELECT 'psql  -U postgres -d ' || datname || '  -c  "SELECT ''******************** D a t a d a b a s e  ''||current_database() ||'' ***********************''  " -t  >> /var/lib/postgresql/scripts/stats/reports.txt'
   FROM pg_stat_database
  WHERE datname IS NOT NULL
   and datname <> 'template0' and datname <> 'template1'

union all

--- Aqui está sendo impressa as tabelas com as informações
SELECT 'psql  -U postgres -d ' || datname || ' -c "SELECT relname, n_live_tup, last_vacuum, last_analyze FROM pg_stat_user_tables "  >> /var/lib/postgresql/scripts/stats/reports.txt'
  FROM pg_stat_database
 WHERE datname IS NOT NULL
   and datname <> 'template0' and datname <> 'template1'
   order by 1;
