class Artist < ActiveRecord::Base

  belongs_to :performance
  has_many :users, through: :performance

end
