class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :login
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true, uniqueness: {case_sensitive: false}

  has_many :created_events, class_name: 'Event', foreign_key: :creator_id
  has_many :event_attendees
  has_many :attending_events, through: :event_attendees, source: :event       

  def self.find_first_by_auth_conditions(warden_conditions)
  	conditions = warden_conditions.dup
  	if login = conditions.delete(:login)
  		where(conditions.to_hash).where("lower(username) = :value OR lower(email) = :value", value: login.downcase).first
	else
		where(conditons.to_hash).first
	end

  end

end

