class Inscription < ActiveRecord::Base

	has_many :scribbles, dependent: :destroy
	belongs_to :alias


	after_save :touch_alias

	validates :title, length: {minimum: 5}, presence: true
	validates :body, length: {minimum: 10}, presence: true
	validates :alias, presence: true
	validate :time_since_post

	private

	def time_since_post
		if (Time.now - self.alias.updated_at) < 5.minutes
			errors.add(:alias_id, "Please wait to post again.")
		end
	end

	def touch_alias
		self.alias.touch
	end

end