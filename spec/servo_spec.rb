require 'spec_helper'

RSpec.describe Servo do
  it 'has a version number' do
    expect(Servo::VERSION).not_to be nil
  end
end
