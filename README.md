# Postgresql_reports
Hi everyone! This project deals with a configuration for printing reports of all databases based on PostgresSQL on your server.
  I'm creating this project because I had problems gettting what i needed, and creating this script solved my company's problems.
  This script serves the Devops part or if necessary print reports from all databases together in a single file.
  I'll explain the command lines and leave documentation for each command used.
  If there is something that can be improved, leave a comment for the changes and give ideas.
  Thanks!
  
  # Documentation
  
  Link Documentation Vacuumdb https://www.postgresql.org/docs/current/app-vacuumdb.html
  
  Link documentation Psql Commands https://www.postgresql.org/docs/devel/app-psql.html
  
  #Instructions
  
  Run the following commands:
  
  1 - cd /var/lib/postgresql/
  
  2 - mkdir scripts
  
  3 - cd scripts/
  (one at time)
  4 - touch pg_reports.sh / touch executar_selects.sh / touch select_reports.sql
  
  5 - chmod 777 pg_reports.sh / chmod 777 executar_selects.sh / chmod 777 seletc_reports.sql
  
  6 - mkdir stats/
  
  7 - ./pg_reports.sh
  
  
  
  
