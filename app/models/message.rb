class Message < ActiveRecord::Base
	has_many :comments, :include => [:user], :dependent => :destroy
	belongs_to :user
end
