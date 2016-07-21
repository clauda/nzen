# NZEN

Ruby 2.3.0
Rails 5
Postgres

ElasticSearch, Redis and RMagick required.


### Setup

`rake db:create`
`rake db:migrate`
`rake db:seed`

There are two rake tasks to load Categories and Districts.

`rake category:seed`
`rake district:seed`

Run web server:

`rails server` or `foreman start`

Live on [localhost:3000](http://localhost:3000)