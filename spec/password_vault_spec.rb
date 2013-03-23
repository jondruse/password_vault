require 'spec_helper'

describe PasswordVault do
  it 'should have a version number' do
    PasswordVault::VERSION.should_not be_nil
  end
end
