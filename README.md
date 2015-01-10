# Pompidou.rb

Pompidou is a toolkit and scaffolding generator for content management systems.

**Please note:** Pompidou is currently unstable, highly subject to significant change and tightly coupled to the idiosyncracies of its author's development workflow.

### Project TODOs:

* Create a generator for a default Public::BaseController
* Create a generator for a default Admin::BaseController
* Write public & admin namespaces to routes.rb if absent
* Generate s3 config file

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pompidou'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pompidou

## Usage

Pompidou's scaffolding is meant to be a drop-in replacement for the default scaffolding generator that ships with Rails. Simply replace `scaffold` with `pompidou:scaffold`. For example, instead of executing

``` bash
$ rails generate scaffold Widget foo:string bar:integer baz:text quux:boolean
```

one would execute:

``` bash
$ rails generate pompidou:scaffold Widget foo:string bar:integer baz:text quux:boolean
```

This will give you the following deviations from the standard scaffolding:

* Two controllers and two sets of resource-style routes, nested within namespaces, including:
* 'Public' routes and a controller that only expose 'index' and 'show'
* 'Admin' routes and a controller that expose the entire CRUD suite 
* View templates with HTML formatted for use with a default installation of the Zurb Foundation CSS framework

It will *not* generate:

* Helpers
* Assets (CSS and JavaScript stubs named after the resource)


## Contributing

1. Fork it ( https://github.com/johnfriel/pompidou/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
