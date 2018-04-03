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
      body = Utils.build_push_order_data(order_data)
      auth_by_store_token!
      response = self.class.post("/stores/#{Config.store_id}/orders", { body: body.to_json })
      data = JSON.parse(response.body) rescue nil

      { status: response.code, data: data }
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
