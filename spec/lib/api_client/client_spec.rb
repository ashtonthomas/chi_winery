describe ApiClient::Client do
  it "does something" do
    method = :get
    url = "https://some-service.chiwindery.com/api/orders/order"
    options = {
        foo: 'bar',
        a: 123,
        'asdf' => 'blah'
    }
    ApiClient::Client.issue_request(method: method, url: url, options: options)

  end
end