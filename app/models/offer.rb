class Offer < ActiveRecord::Base
  belongs_to :distributor
  belongs_to :parent
  has_many :interests
  has_many :users, :through => :interests

  def name
    self[:name] || self[:description]
  end
end
