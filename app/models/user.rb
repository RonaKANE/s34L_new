class User < ApplicationRecord

	has_many :hosts, dependent: :destroy

	validates :user_id, presence: true, 
			  uniqueness: { case_sensitive: false }
	validates :user_mail, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create },
			  uniqueness: { case_sensitive: false }
	validates :password, presence: true, confirmation: true, length: {minimum: 10}

	has_secure_password
end
