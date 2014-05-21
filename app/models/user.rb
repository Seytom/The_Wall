class User < ActiveRecord::Base
	validates :first_name, :last_name, :email, :presence=>true

	has_many :messages
	has_many :comments

	def has_password?(submitted_password)
    	self.password == submitted_password
  	end

	def self.authenticate(email, submitted_password)
	    user = find_by_email(email)
	    return nil if user.nil?
	    return user if user.has_password?(submitted_password)
  	end
end
