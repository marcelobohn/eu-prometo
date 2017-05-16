# rm db/development.sqlite3 db/test.sqlite3 log/development.log
rake log:clear
rake tmp:clear
rake db:drop
rake db:create
rake db:migrate
rake db:seed
