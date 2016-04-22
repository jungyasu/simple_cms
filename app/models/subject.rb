class Subject < ActiveRecord::Base

	# has_one :page
	has_many :pages

	#function call to add rubygem
	acts_as_list

	# 
	# dont need to valide (in most cases):
	# ids, foreign keys, timestamps, booleans, counters
	validates_presence_of :name
	validates_length_of :name, :maximum => 255
	# validates_presence_of vs. validates_length_of :minimum => 1
	# different error messages: "can't be blank" or "is too short"
	# validates_length_of allows strings with only spaces!

	scope :visible, lambda { where(:visible => true) }
	scope :invisible, lambda { where(:visible => false) }
	scope :sorted, lambda { order("subjects.position ASC") }
	scope :newest_first, lambda { order("subjects.created_at DESC") }
	scope :search, lambda {|query|
		where(["name LIKE ?", "%#{query}%"])
	}

end
