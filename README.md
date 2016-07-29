# pinou

Ruby 2.3.0
Rails 5
Postgres

ElasticSearch, Redis and RMagick required.


### Setup

`rake db:create`

`rake db:migrate`

`rake db:seed`

There are a rake task to load some categories, districts and services.

This one can take a several time :coffee:

`rake category:seed` 

`rake district:seed`

`rake service:seed` Load more than 8K business.

Reindexing:

`rake searchkick:reindex:all`

Run web server:

`rails server` or `foreman start`

Live on [localhost:3000](http://localhost:3000)