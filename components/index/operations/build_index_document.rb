class BuildIndexDocument
  include Operation

  # Since, I need to know what components are local
  # (see notes in pact_router)
  # so we don't mock, but instead let the request_router do its thing
  # I'm going to need an index for each compoent
  # (for the pact_router to check)
  # we should be able to utilize that for satisfying this operation
  # (that will _may_ require service calls to each component)
  # but the index component is just another component
  # and may live anywhere (chicken and egg??)

  def call
    {
      something: "cool",
      foo: {
        blah: "asdf",
        something_else: [1, 2, 3],
        hello_wut: {
          sup: "hey"
        }
      },

      concepts: {
        "WineComponent::WineApi" => {
          app_name: "app-1-chi-winery",
          url_template: "https://app-1-chi-winery.herokuapp.com",
          urn_path_template: "/wines/:id",
          url_variables: {
            id: "the ID of the wine"
          },
          formats: [
            :xml,
            :json,
            :binary,
            :txt
          ],
          available_methods: [:get, :put, :post, :delete],
        },

        wine: {
          app_name: "app-1-chi-winery",
          url_template: "https://app-1-chi-winery.herokuapp.com/wine/:id",
          url_variables: {
            id: "the ID of the wine"
          },
          formats: [
            :xml,
            :json,
            :binary,
            :txt
          ],
          available_methods: [:get, :put, :post, :delete],

        },

        order: {
          app_name: "app-2-chi-winery",
          url_template: "https://app-2-chi-winery.herokuapp.com/order/:id/:type",
          url_variables: {
            id: "The ID of the order",
            type: "Idk, something?"
          }
        },

        old_concept: {
          app_name: nil,
          url_template: "http://static.chi-winery/archive/old_concept.html",
          url_variables: {}
        }

      }
    }
  end

  private

end
