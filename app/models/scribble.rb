class Scribble < ActiveRecord::Base
  belongs_to :inscription
  belongs_to :alias

  validates :alias, presence: true
  validates :body, length: {minimum: 5}, presence: true
end