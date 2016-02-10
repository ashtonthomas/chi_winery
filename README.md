- structure of /components
-- highly cohesive concerns bundled as a component
-- api, models, operations, workers(background), listeners(message queue)
-- component for: cohesive unit, external dependency, special (data: acts on db for multiple components*)
- app/apis/application_api (can be dynamically generated)

- lib/components_api/wine/api/wine_api.rb
- lib/components_api/wine/api/wine_index_api.rb (can be dynamically generated)

- components/index/api/index_api.rb (+BuildIndexDocument)


- spec/components/api/order_api_spec.rb
