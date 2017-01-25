class User < ApplicationRecord
	has_many :hosts, dependent: :destroy
	validates :user_id, presence: true
	validates :user_mail, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	validates :password, presence: true, confirmation: true, length: {minimum: 10}
end
