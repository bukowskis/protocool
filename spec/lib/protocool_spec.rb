require 'spec_helper'

describe Protocool do

  let(:protocool) { Protocool }

  context 'if force_ssl is set' do
    before do
      Rails.stub_chain(:application, :config, :force_ssl).and_return true
    end

    describe '.https' do
      it 'uses TLS' do
        protocool.https.should == 'https'
      end
    end

    describe '.protocol' do
      it 'uses TLS' do
        protocool.protocol.should == 'https://'
      end
    end
  end

  context 'if force_ssl is not set' do
    before do
      Rails.stub_chain(:application, :config, :force_ssl).and_return false
    end

    context 'in development mode' do
      before do
        Rails.stub!(:env).and_return mock(:environment, development?: true)
      end

      describe '.https' do
        it 'does not use TLS' do
          protocool.https.should == 'http'
        end
      end

      describe '.protocol' do
        it 'does not use TLS' do
          protocool.protocol.should == 'http://'
        end
      end
    end

    context 'in test mode' do
      before do
        Rails.stub!(:env).and_return mock(:environment, development?: false, test?: true)
      end

      describe '.https' do
        it 'does not use TLS' do
          protocool.https.should == 'http'
        end
      end

      describe '.protocol' do
        it 'does not use TLS' do
          protocool.protocol.should == 'http://'
        end
      end
    end

    context 'in non-dev and non-test mode' do
      before do
        Rails.stub!(:env).and_return mock(:environment, development?: false, test?: false)
      end

      describe '.https' do
        it 'uses TLS' do
          protocool.https.should == 'https'
        end
      end

      describe '.protocol' do
        it 'uses TLS' do
          protocool.protocol.should == 'https://'
        end
      end
    end

  end
end
