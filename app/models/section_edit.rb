class SectionEdit < ActiveRecord::Base

	#belongs to editor, foreign key must be specified because this is going to be a join table
	belongs_to :editor, :class_name => "AdminUser", :foreign_key => "admin_user_id"
	belongs_to :section
end
