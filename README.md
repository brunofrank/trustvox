# Trustvox

Gem to send interact with Trustvox API.

## Installation

```ruby
gem 'trustvox'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install trustvox

## Usage

Set your credentials

```ruby
Trustvox::Config.token = 'PLATFORM TOKEN'
Trustvox::Config.store_token = 'STORE TOKEN'
Trustvox::Config.store_id = 'STORE ID'
```

Or througth ENV vars.

```sh
TRUSTVOX_ACCESS_TOKEN='PLATFORM TOKEN'
TRUSTVOX_STORE_TOKEN='STORE TOKEN'
TRUSTVOX_STORE_ID='STORE ID'
``

Push order information.

```ruby
order = Trustvox::Store.new.push_order({
                    order_id: 1,
                    delivery_date: DateTime.now.to_s,
                    client:  {
                      first_name: 'Homer',
                      last_name: 'Simpson',
                      email: 'homer@fox.com',
                    },
                    items: [{
                      id: 1,
                      url: 'http://www.fox.com/donut',
                      name: 'Donut',
                      price: 2.99,
                      photos_urls: ["http://store.fox.com/donut.png"],
                    }]
                  })
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/brunofrank/trustvox.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
