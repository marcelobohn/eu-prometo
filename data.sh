rm db/development.sqlite3 db/test.sqlite3 log/development.log
rake db:create
rake db:migrate
rake db:seed
