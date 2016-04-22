class AdminUser < ActiveRecord::Base

	# To configure a different table name:
	# self.table_name = "admin_users"

	# #short way
	# attr_accessor :first_name

	# #long way

	# def last_name
	# 	@last_name
	# end

	# def last_name=(value)
	# 	@last_name = value
	# end

	has_secure_password

	has_and_belongs_to_many :pages
	has_many :section_edits

	#traversing a rich association
	has_many :sections, :through => :section_edits

	# EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
	# EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	# EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

	FORBIDDEN_USERNAMES = ['littlebopeep', 'humptydumpty', 'marymary']
	
	# validates_presence_of :first_name
	# validates_length_of :first_name, :maximum => 25
	# validates_presence_of :last_name
	# validates_length_of :last_name, :maximum => 50
	# validates_presence_of :username
	# validates_length_of :username, :within => 8..25
	# validates_uniqueness_of :username
	# validates_presence_of :email
	# validates_length_of :email, :maximum => 100
	# validates_format_of :email, :with => EMAIL_REGEX
	# validates_confirmation_of :email

	#short-cut validation
	validates :first_name, :presence => true, :length => { :maximum => 25}
	validates :last_name, :presence => true, :length => { :maximum => 25}
	validates :username, :uniqueness => true, :length => { :within => 8..25}
	validates :email, :presence =>true, :length => { :maximum => 100 }, :format => EMAIL_REGEX, :confirmation => true
	validate :username_is_allowed
	# validate :no_new_users_on_saturday, :on => :create

	scope :sorted, lambda { order("last_name ASC, first_name ASC") }

	def name
		"#{first_name} #{last_name}"
		# Or: first_name + ' ' + last_name
		# Or: [first_name, last_name].join(' ')
	end

	private

	def username_is_allowed
		if FORBIDDEN_USERNAMES.include?(username)
			errors.add(:username, "has been restricted from use.")
		end
	end

	#Errors not related to a specific attribute
	# can be added to errors [:base]
	def no_new_users_on_saturday
		if Time.now.wday == 6
			errors[:base] << "No new users on Saturdays."
		end
	end
end
