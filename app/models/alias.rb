class Alias < ActiveRecord::Base


	before_save {self.name = name.downcase}
	has_many :inscriptions, dependent: :destroy
	has_many :scribbles, dependent: :destroy

	validates :name, presence: true, length: {minimum: 1, maximum: 20}

end