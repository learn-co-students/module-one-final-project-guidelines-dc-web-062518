class Artist < ActiveRecord::Base

  belongs_to :performance
  has_many :users, through: :performances

  def get_performance
    p = Performance.all.select {|performance| performance.artist == self}
    p[0]
  end


end
