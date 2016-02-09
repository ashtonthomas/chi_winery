# Mondavi


Mondavi is designed to be a lightweight framework for structuring a multi micro service internal system.
It is designed to work with the lightweight ruby, rack, rails alternative napa framework which is designed to
work with the Grape http-based API/routing framework as well as Roar/Representer for returning payloads as well as parsing those payloads.



*why make this a gem?
could add some rake tasks to show route-like stuff


drawbacks:
- not easily knowing what component is where (diagnosing errors/performance in production)
- gem dependencies impact multiple components (encourages more consistency - not that bad?)
- compared to pacto: pacto lets you know immediately when you break something
  (but the fact that this is a virtue is a problem.. -
   Mondavi prevents breaking and allows for evolution over shorter periods of time without breaking things)

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
