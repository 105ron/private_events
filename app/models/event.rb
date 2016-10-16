class Event < ApplicationRecord
	belongs_to :user

	validates :name,  presence: true, length: { maximum: 50 }
	validates :description,  presence: true, length: { maximum: 200, minimum:10 }
end
