class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :interests_attributes, :company, :address, :city, :name_last, :zip_code, :username, :annual_volume, :phone_office, :distributor_id, :is_admin, :fax, :website, :is_active, :name_first, :phone_cell, :state

  belongs_to :distributor

  # The extra conditions and grouping are to protect against orphaned interests or
  # duplicate interests in the same offer
  has_many :interests, :include => :offer, :conditions => "offers.id IS NOT NULL", :group => "offers.id"
  has_many :offers, :through => :interests

  accepts_nested_attributes_for :interests
end
