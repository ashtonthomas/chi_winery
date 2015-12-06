module IndexComponent
  class IndexApi < Grape::API
    get '/' do
      # We need to utilize the service_map
      # we need to return all concepts which may be allowed
      # to have their ID's persisted on foreign services
      # each concept/resources can contain deprecation info (is deprecated, start, end of life, message, etc)
      # Wait, wait. this means I wouldn't need to query each service,
      # yea, querying each server sounds dumb
      # use an index component instead

      # so this index component will have to know about all resources
      # won't this be defined indirectly in the ApiClient
      # like it will know
      # so I can write a spec that goes through all of the ApiClient concepts
      # and methods and makes sure there is an associated entry in the service document?
      # that may be a good idea
      # no, it's not a good idea - ApiClient should be dynamically defining available:
      # concepts and their actions

      # But this IndexComponent can't know each components conepts/actions
      # we still need to call out to each component and build up the index page from there
      # This may seem terrible and a lot of work, but
      # we can cache each components' response
      # so now we need to introduce index actions to each component
      # so this IndexComponent is ONLY concerned with knowing:
      # - The list of Components (not concepts or actions)
      # - What url/machine each component lives on
      # (?) what about static things that are no longer controlled in the component
      # -- Well the component should still deal with 'knowing' this information

      # TODO, how does this play with the ApiClient knowing what components are local (?)
      # The index component can return the machine urls for each component
      # The ApiClient can compare this to some constant (*)
      # we probably don't need a constant - we can probably just look at someother available value
      # -- what value is that? ENV['URL']
      # brings up the point that heroku 'apps' are just collections of components
      # - (there may be some distinctions to be made and communicated clearly)

      # TODO, On Concepts: What about STI concepts (?)


      # What does service_client/api_client know?
      # it knows about concepts and avilable/deprecated (un-removed) actions on each concept
      # well, we could dynamcially define all of the classes
      # and have a helper where WineComponent::Wines.info (or something like that)

      # It does NOT know what machine/urls
      # It ONLY knows about index
      # Index should be api.chi-winery.com/
      # should return all concepts and actions

      #

      # Okay, so this guy needs to know how to call the index of each component
      "return [todo]"
    end
  end
end
