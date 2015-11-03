class Inscription < ActiveRecord::Base

	has_many :scribbles, dependent: :destroy
	belongs_to :alias

	validates :title, length: {minimum: 5}, presence: true
	validates :body, length: {minimum: 10}, presence: true
	validates :alias, presence: true
end