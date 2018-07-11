class User < ActiveRecord::Base

  has_many :plans
  has_many :performances, through: :plan
  has_many :artists, through: :performances

  def add_performance

  end

end
