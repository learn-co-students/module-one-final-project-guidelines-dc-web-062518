class Artist < ActiveRecord::Base

  has_one :performance
  has_many :users, through: :performance


end
