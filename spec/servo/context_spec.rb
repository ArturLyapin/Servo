require 'spec_helper'

RSpec.describe Servo::Context do
  describe '.initialize' do
    subject { described_class.new(params) }

    context 'when params are not empty' do
      let(:params) { { test: '123' } }

      it { expect(subject.test).to eq('123') }

      it 'defines a setter' do
        cache = subject
        cache.test = '456'
        expect(cache.test).to eq('456')
      end

      context 'when use invalid attr_accessor`s name' do
        it { expect { subject.invalid_name }.to raise_error(NoMethodError) }
      end
    end
  end
end
