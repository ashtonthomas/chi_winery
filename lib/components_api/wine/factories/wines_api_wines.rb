FactoryGirl.define do
  sequence :wine_name do |n|
    "FactoryWine#{n}"
  end

  factory :wine do |b|
    name {FactoryGirl.generate(:wine_name)}
    vintage 1988
  end

  factory :wines_api_wines_get_id_nil do |w|
    name "Robert Mondavi"
    vintage 1976
  end

  factory :wines_api_wines_get_id_1 do |w|
    name "Robert Mondavi"
    vintage 1976
  end

end

foo = {
  # Component
  wines_api: {
    # Context
    wines: {
      # Method
      get: {
        # Parameters
        id_nil: {
          name: "asdf",
          vintage: 1975
        },
        id_1: {
          name: "asdf",
          vintage: 1975
        }
      }
    }
  }
}
