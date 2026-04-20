require 'spec_helper'

describe OmniAuth::Strategies::Bolder do
  subject do
    OmniAuth::Strategies::Bolder.new({})
  end

  context "client options" do
    it 'should have correct site' do
      subject.options.client_options.site.should eq("https://api.onbolder.com/v1")
    end

    it 'should have correct authorize url' do
      subject.options.client_options.authorize_url.should eq('https://auth.onbolder.com/oauth/authorize')
    end

    it 'should have correct token url' do
      subject.options.client_options.token_url.should eq('https://auth.onbolder.com/oauth/token')
    end
  end

end
