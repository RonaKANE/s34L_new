class User < ApplicationRecord
	has_many :hosts, dependent: :destroy
	validates :user_id, presence: true
end
