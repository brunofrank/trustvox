describe Trustvox::VERSION do
  it 'should have a version' do
    expect(Trustvox::VERSION).to be_truthy
  end
end

describe Trustvox::Config do

  after do
    Trustvox::Config.token = nil
    Trustvox::Config.store_token = nil
    Trustvox::Config.store_id = nil
    ENV['TRUSTVOX_ACCESS_TOKEN'] = nil
    ENV['TRUSTVOX_STORE_TOKEN'] = nil
    ENV['TRUSTVOX_STORE_ID'] = nil
  end

  context "Given i had set througth ENV vars" do
    it 'i should retrieve the store_id' do
      ENV['TRUSTVOX_STORE_ID'] = '111'
      expect(Trustvox::Config.store_id).to eq('111')
    end

    it 'i should retrieve the token' do
      ENV['TRUSTVOX_ACCESS_TOKEN'] =  '222'
      expect(Trustvox::Config.token).to eq('222')
    end

    it 'should retrieve the token' do
      ENV['TRUSTVOX_STORE_TOKEN'] =  '333'
      expect(Trustvox::Config.store_token).to eq('333')
    end
  end

  context "Given i manually set" do
    it 'i should set and get the store_id' do
      Trustvox::Config.store_id = '444'
      expect(Trustvox::Config.store_id).to eq('444')
    end

    it 'i should set and get the token' do
      Trustvox::Config.token = '555'
      expect(Trustvox::Config.token).to eq('555')
    end

    it 'i should set and get the store_token' do
      Trustvox::Config.store_token = '666'
      expect(Trustvox::Config.store_token).to eq('666')
    end
  end

  it 'should put it on staging' do
    Trustvox::Config.staging!
    expect(Trustvox::Config.is_on_staging?).to be true
  end

  it 'should put it on production' do
    Trustvox::Config.production!
    expect(Trustvox::Config.is_on_staging?).to be false
  end
end
