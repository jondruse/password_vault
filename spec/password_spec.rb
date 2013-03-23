require 'spec_helper'

describe PasswordVault::Password do

  let(:p) {PasswordVault::Password.new}

  it "should store some attribs" do
    p.name     = "twitter"
    p.username = "joeshmoe"
    p.password = "youllneverguess"
    p.url      = "http://twitter.com"

    p.name.should == "twitter"
    p.username.should == "joeshmoe"
    p.password.should == "youllneverguess"
    p.url.should == "http://twitter.com"
  end

end
