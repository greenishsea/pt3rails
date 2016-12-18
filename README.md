# pt3rails

A rails boilerplate especially for pt3react frontend project.

Including package.json and dev and prod webpack.config.js (in config_client folder)  
for integrated development and building production code.  
Expect to clone pt3react with naming client.

## features
- rails 5
- foreman for rails & hypernova & webpack-dev-server parallel run 
- devise
- retuning json with jbuilder
- db in production: postgresql
- debug gem for vscode debugging
- rubocop
- and others

## Setup
- install
```
bundle install
rails db:migrate
rails db:seed
npm install
git clone [pt3react repo] client
```

- load test data to db  
   (* Before loading, replace 'seeds_sapporo_spot_en' file with actual data or change 'seeds.rb' code.)
```
rails db:seed
```


- optional: registering sample user
```
rails s
curl localhost:3000/v1/users --data "email=user@example.com&password=password"
```
- optional: checking sample user token
```
rails s
curl localhost:3000/v1/login --data "email=user@example.com&password=password"
```

- mod css/scss/js if it has invalid path
- switch client's entry.js from client rendering to SSR
- check app/views/sample/index.html.erb code is for SSR

- launch in dev mode
```
foreman start
open localhost:5000
```

## TODO
- integrate with Docker & docker-compose or ansible
- (before_compile.rb) fix rake task for deploying client app when pushing heroku repo

## License

MIT © [greenishsea]