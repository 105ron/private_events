class Attendee < ApplicationRecord
	scope :new_event, lambda { where(["events.date > ?", Time.now]) }
	scope :old_event, lambda { where(["events.date < ?", Time.now]) }
	belongs_to :user
	belongs_to :event
end
