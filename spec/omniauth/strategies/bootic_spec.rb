require 'spec_helper'

describe OmniAuth::Strategies::Bootic do
  subject do
    OmniAuth::Strategies::Bootic.new({})
  end

  context "client options" do
    it 'should have correct site' do
      subject.options.client_options.site.should eq("https://api.bootic.net")
    end

    it 'should have correct authorize url' do
      subject.options.client_options.authorize_url.should eq('https://api.bootic.net/oauth/authorize')
    end

    it 'should have correct token url' do
      subject.options.client_options.token_url.should eq('https://api.bootic.net/oauth/token')
    end
  end

end