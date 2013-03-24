require 'openssl'
require 'fileutils'

class PasswordVault::Vault

  def initialize(key)
    @key = Digest::SHA512.digest(key)
  end

  def passwords
    @passwords ||= []
  end

  def get_password(name)
    found = @passwords.select {|p| p.name == name }
    found.first
  end

  def write
    File.open(PasswordVault::VaultFile, 'w') {|f| f.write(lock) }
  end

  def read
    unlock File.read(PasswordVault::VaultFile)
  end

  def lock
    crypt(:encrypt, dump)
  end

  def unlock(data)
    dump = crypt(:decrypt, data)
    @passwords = Marshal.load(dump)
  end

  def dump
    Marshal.dump(passwords)
  end

  private
  def crypt(mode, data)
    cipher = OpenSSL::Cipher.new 'AES256'
    cipher.send mode
    cipher.key = @key
    cipher.update(data) << cipher.final
  end
end
