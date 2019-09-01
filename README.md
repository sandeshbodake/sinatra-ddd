# Ruby web API + Simple ReactJS front end.

Rack application that uses Sinatra as the web framework. It has a basic Domain Driven Design approach. 
It does not use anything of Ruby on Rails.

The server consists of three layers Presentation (`server/presentation`), Domain (`server/domain`) and Infrastructure (`server/infrastructure`).

* Presentation.  Over this layer resides the web GUI (based on ReactJS, under `presentation/view`) and the web API endpoints, in charge of handling the client request and choosing (not to do) the right action to take. 
It is also in charge of response serialization and request validation for the web API.

* Domain. Every logic concerning (abstracting) real-world operations should be condensed here.

* Infrastructure. Supportive layer to provide access to services outside this server. Databases, Web Services, Event messages, etc. It keeps clean the domain against dependencies.

Aside from these layers, there are two important packages: `config`, and `server/util`

* the config package contains configurations about external services and this server itself.
* the util package contains artifacts that can be used all across the server.

**Note:** The variables described in .env must be loaded before performing any operation. Only rake tasks load those variables automatically (`require 'dotfile/load'`).

## Rake tasks

### Run the project

```
rake run
```
or
```
rake run_dev
```
(supposed to reload services when code changes)

Internally it will run the server as a rack application:
```
rackup
```
and the frontend code will be processed with (in server/presentation/view/ folder):
```
webpack --watch --config webpack.config.js --mode development
```
### Run tests
#### Run all tests
```
rake rspec
```
#### Run integration tests
```
rake rspec spec/int
```
#### Run unit tests
```
rake rspec spec/unit
```
### See the current routes
```
rake routes
```
General routes (routes to single resources) are defined in `config/routes.rb`. 
  Specific routes (methods to a specific resource) are defined in the correspondent controller.

The file `config/routes.rb` describes a Proc object that makes possible the routings searching task, but the server is going to work fine as long as each general route (in fact, a rack application) does exist in a rack scope (e.g. main `config.ru`), also it should be correctly configured: ( `map('/some-resource') { run SomeResourceController }` )

```ruby
{ |_|
  [
    { path: '/persons/', handler: Presentation::Controller::PersonController },
    { path: '/', handler: Presentation::Controller::ApplicationController }
  
  ].each { |route| map(route[:path]) { run route[:handler] } }
}
```

### Database tasks
These tasks are defined in the `config/db/database.rake` file. ActiveRecord has been used to perform the operations. 

It is recommended to use a gem (on top of ActiveRecord) that provides these database functions.
A good example could be `otr-activerecord` or `standalone_migrations`

#### Create database
```
rake db:create
```
#### Drop database
```
rake db:drop
```
#### Apply migrations
```
rake db:migrate
```
#### Rollback last migration
```
rake db:rollback
```
#### Seed the database
```
rake db:seed
```
#### Generate schema file
```
rake db:schema
````
#### Reset the database
```
rake db:reset
```
#### Create a new migration
After executing this command, it is needed to modify the created files to fulfill specific needs.
```
rake db:migration new_migration_name
```
