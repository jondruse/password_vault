require 'spec_helper'
require 'fakefs'

describe PasswordVault::Vault do
  let(:vault) {PasswordVault::Vault.new('mykey')}
  let(:twitter) {
    p          = PasswordVault::Password.new
    p.name     = "twitter"
    p.username = "joe.moe"
    p.password = "youllneverguess"
    p
  }
  let(:vp) {
    vault.passwords << twitter
    vault
  }

  it "should have 0 passwords" do
    vault.passwords.size.should == 0
  end

  it "should add new passwords" do
    twitter

    vault.passwords << twitter

    vault.passwords.size.should == 1
  end

  it "should retrieve passwords by name" do
    vp.get_password("nothere").should be_nil
  end

  it "should marshal dump/load" do
    dump = vp.dump
    dump.class.should == String
    loaded = Marshal.load(dump)
    loaded.first.name.should == "twitter"
  end

  it "should encrypt the stuff" do
    vp.lock.class.should == String
  end

  it "should decrypt the stuff also" do
    data = vp.lock
    unlocked = vp.unlock(data)

    unlocked.class.should == Array
    unlocked.first.name.should == "twitter"
  end

  it "should write/read to/from a file" do
    File.exists?(PasswordVault::VaultFile).should be_false
    vp.write
    File.exists?(PasswordVault::VaultFile).should be_true

    vault = PasswordVault::Vault.new("mykey")
    vault.passwords.size.should == 0

    vault.read

    vault.passwords.size.should == 1
  end

end
