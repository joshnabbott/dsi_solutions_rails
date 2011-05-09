class Offer < ActiveRecord::Base
  belongs_to :distributor
  belongs_to :parent
end
