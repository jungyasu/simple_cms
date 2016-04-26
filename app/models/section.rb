class Section < ActiveRecord::Base

	has_many :section_edits
	belongs_to :page
	#
	# has_many :admin_users, :through => :section_edits
	has_many :editors, :class_name => "AdminUser", :through => :section_edits

	acts_as_list :scope => :page

	after_save :touch_page

	CONTENT_TYPES = ['text','HTML']

	validates_presence_of :name
	validates_length_of :name, :maximum => 255
	validates_inclusion_of :content_type, :in => CONTENT_TYPES, :message => "must be one of: #{CONTENT_TYPES.join(', ')}"
	validates_presence_of :content

	scope :visible, lambda { where(:visible => true) }
	scope :invisible, lambda { where(:visible => false) }
	scope :sorted, lambda { order("sections.position ASC") }
	scope :newest_first, lambda { order("sections.created_at DESC") }


	# def self.tagged_with(name)
	# 	Tag.find_by_name!(name).articles
	# end

	# def self.tag_counts
	# 	Tag.select("tags.*, count(taggigs.tag_id) as count").joins(:taggings).group("taggings.tag_id")
	# end

	# def tag_list
	# 	tags.map(&:name).join(", ")
	# end

	# def tag_list=(names)
	# 	self.tags = name.split(",").map do |n|
	# 		Tag.where(name: n.strip).first_or_create!
	# 	end
	# end

	private
	def touch_page
		# touch is similar to:
		# subject.update_attribute(:updated_at, Time.now)
		page.touch
	end
end
