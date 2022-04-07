# README

Ruby Version: 3.1.1p18

Bundler Version: 2.3.7

To get this application running, first make sure that you have the correct version of ruby installed. I like to use [rbenv](https://github.com/rbenv/rbenv) 
to manage multiple versions of ruby in my environment. Once you have the correct version of ruby installed, you need to install the correct version of 
[bundler](https://bundler.io/):

`gem install bundler -v 2.3.7`

With bundler installed, run `bundle install` to install the required gems. There may be other commands that need to be run in order to install
dependencies. Follow the instructions to resolve any issues.

Once the bundle install command has completed, run `yarn` to install the required JavaScript packages.

At this point, you should be able to run `rails db:migrate` to run the needed database migration. After
the migration has completed, run `rails s` to start the server. With the server running, the application
will be accessible at http://127.0.0.1:3000
