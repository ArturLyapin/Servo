require "spec_helper"

RSpec.describe Servo do
  it "has a version number" do
    expect(Servo::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
