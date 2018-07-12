class User < ActiveRecord::Base
  has_many :plans
  has_many :performances, through: :plans
  has_many :artists, through: :performances
end
