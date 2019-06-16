class Performance < ActiveRecord::Base
  belongs_to :artist
  has_many :plans
  has_many :users, through: :plans


end
