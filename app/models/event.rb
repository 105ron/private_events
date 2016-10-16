class Event < ApplicationRecord
	belongs_to :user
	has_many :attendees
	has_many :users, through: :attendees

	validates :name,  presence: true, length: { maximum: 50 }
	validates :description,  presence: true, length: { maximum: 200, minimum:10 }
end
