class User < ActiveRecord::Base
	before_save :encrypted_password if :password_changed?

  def encrypted_password
     # salt = ENV['SALT'] # We save the value of: SecureRandom.random_bytes(64)
	     key = ENV['KEY']   # We save the value of: ActiveSupport::KeyGenerator.new('password').generate_key(salt)
	     crypt = ActiveSupport::MessageEncryptor.new(key)
	     password = self.password # Input value from our form
	     encrypted_data = crypt.encrypt_and_sign(password) # or crypt.encrypt_and_sign(self.password)
	     self.password = encrypted_data
	     # You can refactor to make these steps shorter.
	end

	def decrypted_password password
		crypt = ActiveSupport::MessageEncryptor.new(ENV['KEY'])
		crypt.decrypt_and_verify(password) # Original value!		
	end
end
