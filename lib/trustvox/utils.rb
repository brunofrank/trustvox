module Trustvox
  # Responsible to api calls about store
  class Utils
    DEFAULT_ORDER = {
      order_id: nil,
      delivery_date: nil,
      client: {},
      items: [],
      tags: []
    }

    DEFAULT_ORDER_ITEM = {
      id: nil,
      url: nil,
      name: nil,
      price: nil,
      photos_urls: [],
      tags: [],
      extra: {}
    }

    DEFAULT_CLIENT = {
      first_name: nil,
      last_name: nil,
      email: nil,
      tags: []
    }

    def self.build_push_order_data(order_data)
      body = DEFAULT_ORDER.merge(order_data)

      body[:items] = order_data[:items].map do |item|
        DEFAULT_ORDER_ITEM.merge(item)
      end

      body[:client] = DEFAULT_CLIENT .merge(order_data[:client])

      body
    end
  end
end
