class Scribble < ActiveRecord::Base
	
  belongs_to :inscription
  belongs_to :alias

  after_save :touch_alias


  validates :inscription, presence: true
  validates :alias, presence: true
  validates :body, length: {minimum: 5}, presence: true
  validate :time_since_comment


  private

  def time_since_comment
  	if (Time.now - self.alias.updated_at) < 3.minutes
		errors.add(:alias_id, "Please wait to post again.")
	end

  end

  def touch_alias
  	self.alias.touch
  end


end