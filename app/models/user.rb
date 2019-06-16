class User < ActiveRecord::Base
  has_many :plans
  has_many :performances, -> {order(time: :asc)}, through: :plans
  has_many :artists, through: :performances


end
