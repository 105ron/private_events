class Event < ApplicationRecord
	scope :upcoming, lambda { where(["date > ?", Time.now]) }
	scope :past, lambda { where(["date < ?", Time.now]) }

	belongs_to :user
	has_many :attendees
	has_many :users, through: :attendees

	validates :name,  presence: true, length: { maximum: 50 }
	validates :description,  presence: true, length: { maximum: 200, minimum:10 }

	def self.upcoming_events
		#These two methods redundant. Run Query via SQL in scopes above
		results = [] 
		Event.all.each do |x| 
			if x.date > Time.now
				results << x
			end
		end
		return results
	end

	def self.previous_events
		results = [] 
		Event.all.each do |x| 
			if x.date < Time.now
				results << x
			end
		end
		return results
	end
end
