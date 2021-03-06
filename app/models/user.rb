class User < ApplicationRecord
	has_many :events, dependent: :destroy
	has_many :attendees
	has_many :events, through: :attendees

	validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }


  def upcoming_events
  	Event.joins(:attendees).
  	where("events.date > ?", Time.now).
  	where("attendees.user_id = :user_id", user_id: id).
  	order(date: :asc)
  end

  def past_events
  	Event.joins(:attendees).
  	where("events.date < ?", Time.now).
  	where("attendees.user_id = :user_id", user_id: id).
  	order(date: :desc)
  end

end
