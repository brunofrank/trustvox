describe Trustvox::Store do
  before do
    Trustvox::Config.token = 'TOKEN'
    Trustvox::Config.store_token = 'STORE'
  end

  after do
    Trustvox::Config.token = nil
    Trustvox::Config.store_token = nil
  end

  it 'Should create a store' do
    company_name = 'Banco do Brasil S/A'
    store = Trustvox::Store.new.create({
      name: company_name,
      cnpj: '00.000.000/0001-91',
      email: Faker::Internet.email,
      url: 'http://www.bb.com.br/',
      photo_url: 'https://beta.labbs.com.br/images/bb_logo.png',
      platform_name: 'Outros'
    })

    expect(store).to be_truthy
    expect(store.id).to be_truthy
    expect(store.name).to eq(company_name)
  end

  it 'Should push an order to store' do
    order = Trustvox::Store.new.push_order({
      order_id: Faker::Number.number(10),
      delivery_data: Faker::Date.backward(7),
      client:  {
        email: Faker::Internet.email,
        first_name: 'Charles',
        last_name: 'Montgomery Burns'
      },
      items: [
        {
          id: Faker::Number.number(10),
          url: 'http://www.bb.com.br/produtox',
          name: 'iPhone X',
          price: 4599,
        }
      ],
      url: 'http://www.bb.com.br/',
      photo_url: 'https://beta.labbs.com.br/images/bb_logo.png',
      platform_name: 'Outros'
    })

    expect(order).to be_truthy
    expect(order.id).to be_truthy
    expect(order.name).to eq('Store test')
  end

  it 'Should get previous created store' do
    store = Trustvox::Store.new.load_store('http://www.abuze.com.br')

    expect(store).to be_truthy
    expect(store.id).to be_truthy
    expect(store.name).to eq('Banco do Brasil S/A')
  end

  it 'Should set platform token' do
    store = Trustvox::Store.new

    expect(store.class.default_options[:headers][:Authorization]).to eq('token TOKEN')
  end

  it 'Should set store token' do
    store = Trustvox::Store.new
    store.auth_by_store_token!

    expect(store.class.default_options[:headers][:Authorization]).to eq('token STORE')
  end
end
