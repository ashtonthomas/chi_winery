# Mondavi


Mondavi is designed to be a lightweight framework for structuring a multi micro service internal system.
It is designed to work with the lightweight ruby, rack, rails alternative napa framework which is designed to
work with the Grape http-based API/routing framework as well as Roar/Representer for returning payloads as well as parsing those payloads.

- Ruby, Rack, Grape, Napa microservices
- Avoid Rails overhead and running headfirst into a monlith that is slower and slower to evolve with increasing brittleness
- Avoid microservice explosion and being stuck with the incorrect (or changing) boundaries you draw around your services
-- Things start as expirements, then evovle, but your stuck with decisons from the past, which were made with limited, now out of date information


Mondavi imposes a few requirements in terms of some lightweight technologies and the structure of your applications
It also provides the equivalent of a 'api-client-interface-thing' (a shared library that helps you call out to all other internal services)


*why make this a gem?
could add some rake tasks to show route-like stuff
- dynamically generate response for ComponentIndex
- lib files + specs
- dynamic ApplicationApi file
- spec helper stuff?


drawbacks:
- not easily knowing what component is where (diagnosing errors/performance in production)
- gem dependencies impact multiple components (encourages more consistency - not that bad?)
- compared to pacto: pacto lets you know immediately when you break something
  (but the fact that this is a virtue is a problem.. -
   Mondavi prevents breaking and allows for evolution over shorter periods of time without breaking things)


Some assumptions:
- Ruby, Rack, Grape, Napa, Roar
- Roar representers are used to serialize and deserilize
- Organization of Components with Index and ComponentIndex'es


```
heroku create app-1-chi-winery

heroku buildpacks
# heroku buildpacks:set heroku/ruby
heroku buildpacks:add https://github.com/ashtonthomas/nginx-buildpack.git
heroku buildpacks
# 1. heroku/ruby
# 2. https://github.com/ashtonthomas/nginx-buildpack.git
#
# Set DATABASE_URL
```

TODO: Add an awesome README that explains how all this stuff works!

https://gist.github.com/ashtonthomas/02e598c9e28dbc0ce419

Can I use postgres schema to mimich the component boundaries in the database:
http://jerodsanto.net/2011/07/building-multi-tenant-rails-apps-with-postgresql-schemas/

Avoiding spec_helper:
- TBD: best way to make blazing fast specs

`bundle exec puma -C config/puma.rb`

`bundle update --source gemname`

http://codetunes.com/2014/grape-part-II/

```
env = {}
env['rack.input'] = Puma::NullIO.new
env['REQUEST_METHOD'] = 'GET'
env['REQUEST_PATH'] = '/orders/hello'
env['REQUEST_URI'] = '/orders/hello'
env['PATH_INFO'] = '/orders/hello'

```

I should just be able to call ApplicationApi.call(env)
construct the env hash as normal
and parse the response indifferent to whether we are going
across the network or not


http://stackoverflow.com/questions/19206764/how-can-i-load-activerecord-database-tasks-on-a-ruby-project-outside-rails


## Questions:

- requiring ruby files in/outside of a class def (regular vs in gem)?

On component naming
- I guess most times a component will be named after the most
- prominent model..
- this creates some confusion
- so I may want to say wines_component


# Patterns to Follow

- Controller only handle HTTP stuff
- models only handle data access stuff (validations?)
- never use callbacks (?)
- Avdi's Naught/NullObject pattern (checking `nil` is always wrong?) (Naught, NullObject, Safe Navigation)
- Naught does seem really cool: https://github.com/avdi/naught
- Sandi's input on this: https://www.youtube.com/watch?v=OMPfEXIlTVE (and on good OOD)


# On Grape: can we dynamically create ComponentsApi/ApiClient? from the ServiceDocument (based on the api definitions)
- maybe dynamically generate it, but it has to live on it's on - like a gem - so we can do it at runtime dynamically (??)
- not a big deal. we just build the mocks from the pact definitions (so this isn't that big of a concern)


# Misc

Services seem to be a bad way to organize application code.
It sucks when you want to add a 'component' and not a full services
(because of the maintenance overhead).
Would be great to be able to stick a component anywhere. This would be great for experimental components.
We can just have a misc server where we stick components. It shouldn't matter what components are physically next to each other.



Models should only be involved with Access/Persistence (no business logic, not even validations)
- We should use a Validation MethodObject
- We should be using CreateFoo MethodObject which can handle the equivalent of callbacks.
- FooModel should be prefixed with a compoennt: FoodingComponentImpl::FooModel
- You should never all a model in a different component module (you will hate yourself)
- ((seriously, don't do it - The component structure is about managing your dependencies as well - use the Api of the component dependency - no exceptions))

# Awesome-print
- can we include this?

# dry-component (dry-container/auto_inject)
- https://github.com/dryrb/dry-component
- maybe we should have a FooComponent < Dry::Component::Container
- FooComponent.register('foo.')

# Notes about an Application/Server (app-1-my-org.*)

- Gemfile
-- Can we build something like the Gemfile for components
-- and have a dynamic gemfile that is generated on demand (and alerts to any incompatibilities)
-- Is there a way to actually do this??

- ApplicationApi
-- Knows about all the local components (can we do this dynamically? - build this into Mondavi?)

