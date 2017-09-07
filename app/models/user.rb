class User < ActiveRecord::Base
	validates_presence_of :email
	rolify
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable
	def is_admin?
	    self.has_role? :admin
	end
end
