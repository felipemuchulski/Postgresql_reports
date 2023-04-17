#/bin/bash
# First the date of the report will be printed to display in the final file
echo `date` > /var/lib/postgresql/scripts/stats/reports.txt
echo >> /var/lib/postgresql/scripts/stats/reports.txt


echo '|------------------------------------------------|' >> /var/lib/postgresql/scripts/stats/reports.txt
echo '|'' Starting Vacuumdb' `date`  '|' >............. >> /var/lib/postgresql/scripts/stats/reports.txt


# Run vacuumdb command
echo
echo "||---------------------------||"  
echo "||     STARTING VACUUMDB     ||"  
echo "||---------------------------||" 

: "
In this part we have two options.

If you are setting up this script on a system postgres user. The vacuumdb command will be as follows:

vacuumdb -q -a -z

If you are going to run this file as root, the following syntax must be entered

sudo -H -u postgres bash -c 'vacuumdb -q -a -z'

The -H parameter is a security policy that allows setting the HOME environment variable to the root user by default.

The -u parameter specifies the user to run the command
"
sudo -H -u postgres bash -c ' vacuumdb -q -a -z '


echo '|'' Vacuumdb finished' `date` '|' >> /var/lib/postgresql/scripts/stats/reports.txt
echo '|------------------------------------------------|' >> /var/lib/postgresql/scripts/stats/reports.txt
echo >> /var/lib/postgresql/scripts/stats/reports.txt


# Run sql's commands
echo
echo "||------------------------||"  
echo "|| STARTING COMMANDS SQL  ||"  
echo "||------------------------||" 

echo '|--------------------------------------------------------------|' >> /var/lib/postgresql/scripts/stats/reports.txt
echo '| Starting commands  sql' `date` '         |' >> /var/lib/postgresql/scripts/stats/reports.txt

psql -U postgres -d postgres -c "SELECT datname, numbackends, tup_fetched, stats_reset FROM pg_stat_database WHERE datname IS NOT NULL and datname <> 'template0' and datname <> 'template1'" > /var/lib/postgresql/scripts/stats/database_status.txt

psql -t -U postgres -d postgres -c '\i '/var/lib/postgresql/scripts/select_reports.sql'' > /var/lib/postgresql/scripts/executar_selects.sh

echo '| Finished executing sql commands' `date` '|' >> /var/lib/postgresql/scripts/stats/reports.txt
echo '|--------------------------------------------------------------|' >> /var/lib/postgresql/scripts/stats/reports.txt
echo >> /var/lib/postgresql/scripts/stats/reports.txt

# The next commands will be executed to extract the information from the database and we will pass them to the final file.
echo '|--------------------------------------------------------------------|' >> /var/lib/postgresql/scripts/stats/reports.txt
echo '| Start of printing reports' `date` '            |' >> /var/lib/postgresql/scripts/stats/reports.txt
echo '|--------------------------------------------------------------------|' >> /var/lib/postgresql/scripts/stats/reports.txt
echo >> /var/lib/postgresql/scripts/stats/reports.txt

echo
echo "||---------------------------||" 
echo "|| START OF PRINTING REPORTS ||"
echo "||---------------------------||" 
echo
echo >> /var/lib/postgresql/scripts/stats/reports.txt
exec /var/lib/postgresql/scripts/executar_selects.sh