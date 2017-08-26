require "spec_helper"

RSpec.describe Servo::Service do
  describe '#call' do
    subject {described_class.call}

    context 'when service is success' do
      it {expect(subject).to be_kind_of(Servo::Context)}
      it {is_expected.to be_success}
      it {is_expected.not_to be_failure}
    end

    xcontext 'when service is not success' do
      subject do

      end

      it {expect(subject).to be_kind_of(Servo::Context)}
      it {is_expected.not_to be_success}
      it {is_expected.to be_failure}
    end

    context 'when service has context accessors' do
      before {described_class.context_accessors(:test)}

      it 'defines accessors for context' do
        context = subject
        expect {context.test}.not_to raise_error
        context.test = '123'
        expect(context.test).to eq('123')
        expect {context.invalid_name}.to raise_error(NoMethodError)
      end
    end
  end
end
