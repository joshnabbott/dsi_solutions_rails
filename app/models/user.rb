class User < ActiveRecord::Base
  belongs_to :distributor
  has_many :interests
  has_many :offers, :through => :interests #, :conditions => { 'interests.response' => 'yes' }
end
