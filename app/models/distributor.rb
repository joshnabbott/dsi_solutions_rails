class Distributor < ActiveRecord::Base
  has_many :offers
  has_many :users
  validates :name, :presence => true
end
