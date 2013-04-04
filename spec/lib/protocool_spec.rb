require 'spec_helper'

describe Protocool do

  let(:dev_env)     { mock(:environment, development?: true) }
  let(:another_env) { mock(:environment, development?: false) }
  let(:protocool)   { Protocool }

  before do
    Rails.stub!(:env).and_return another_env
  end

  describe '.https' do
    it 'uses HTTPS by default' do
      protocool.https.should == 'https'
    end
  end

  context 'in development environment' do
    describe '.https' do
      it 'uses HTTP' do
        Rails.stub!(:env).and_return dev_env
        protocool.https.should == 'http'
      end
    end
  end

end
