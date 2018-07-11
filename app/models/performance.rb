class Performance < ActiveRecord::Base
  belongs_to :artist
  has_many :users, through: :plan
end
