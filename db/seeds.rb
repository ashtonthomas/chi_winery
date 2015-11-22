# Handle the factories for this application as needed
# but pull the values from api_client/stubs
# no, that's not right. the API should determine DB factories
FactoryGirl.create(:wine, :name => "Other")

ApiClient::Seeder.load_seeds
