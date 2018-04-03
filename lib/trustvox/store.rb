module Trustvox
  # Responsible to api calls about store
  class Store < Base

    # Call create store api
    # @param store_data
    def create(store_data)
      auth_by_platform_token!
      response = self.class.post('/stores', { body: store_data.to_json })
      data = JSON.parse(response.body) rescue nil

      {
        status: response.code,
        data: data,
      }
    end

    # Call order api
    # @param order_data
    def push_order(order_data)
      body = {
        order_id: nil,
        delivery_date: nil,
        client: {},
        items: [],
        tags: []
      }.merge(order_data)

      body[:items] = order_data[:items].map do |item|
        {
          id: nil,
          url: nil,
          name: nil,
          price: nil,
          photos_urls: [],
          tags: [],
          extra: {}
        }.merge(item)
      end

      body[:client] = {
        first_name: nil,
        last_name: nil,
        email: nil,
        tags: []
      }.merge(order_data[:client])

      auth_by_store_token!
      response = self.class.post("/stores/#{Config.store_id}/orders", { body: body.to_json })
      data = JSON.parse(response.body) rescue nil

      {
        status: response.code,
        data: data,
      }
    end

    # Call store lookup api
    # @param url
    def load_store(url)
      auth_by_platform_token!
      response = self.class.get("/stores", { query: { url: url} })
      data = JSON.parse(response.body) rescue nil

      {
        status: response.code,
        data: data,
      }
    end
  end
end
