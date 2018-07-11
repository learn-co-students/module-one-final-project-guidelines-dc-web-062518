class Artist < ActiveRecord::Base

  belongs_to :performance

  def get_performance
    Performance.all.select do |performance|
      performance.artist == self
    end
  end


end
