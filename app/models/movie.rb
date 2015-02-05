class Movie < ActiveRecord::Base
	scope :newest_first, -> { order(created_at: :DESC) }
 	scope :most_recent_three, -> { newest_first.limit(3) }
 	scope :created_before, ->(time) { where("created_at < ?", time) }
end
