class Inscription < ActiveRecord::Base
	has_many :scribbles, dependent: :destroy
end