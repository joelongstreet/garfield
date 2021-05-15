require 'spec_helper'

describe Garfield::Models::Pizza do
  it 'has a valid factory' do
    expect(build(:pizza)).to be_valid
  end
end