# ArtFundi

Prerequisite
=======================
Composer 
Node.js 
Mysql 
Vscode or IDE of choice 
========================

Step1 
========================
after downloading the repo 

import the crm.sql file into your mysql database 

make sure you move the Artfundi folder to wamp64/www  or xamp/www directory>
===============================================================================


Step 2 
=====================================
open the crm-api folder directory and update the .env file  to config database connection 

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=crm
DB_USERNAME=XXXXXXXXX
DB_PASSWORD=XXXXXXXXX

=====================================================================================

Step 3 
===============================
once you done configuring database in the crm-api directory / folder 
run the project with command in terminal 

crm-api> php artisan serve 

then access the crm-client directory in different terminal 
then run project with command in terminal 

crm-client> npm run dev 

===================================================

Login Details 
===================================================
user :  Admin@artFundi.art
pass :  P@ssword1
