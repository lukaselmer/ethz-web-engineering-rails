ETHZ Web Engineering Rails
==========================

Setup
-----

Install rbenv: https://github.com/sstephenson/rbenv

```
git clone git@github.com:lukaselmer/ethz-web-engineering-rails.git
cd ethz-web-engineering-rails
rbenv install
gem install bundler
bundle
cp config/database.example.yml config/database.yml
cp config/secrets.example.yml config/secrets.yml
# adjust config...
rake db:migrate
```

Run tests
---------

```
rake test
rspec
```

Run server
----------

```
rails s
```

Deployment
----------

http://eth.herokuapp.com/

```
git remote add heroku git@heroku.com:eth.git
git push heroku master
```
