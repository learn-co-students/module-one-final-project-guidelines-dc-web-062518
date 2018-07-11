class User < ActiveRecord::Base
  has_many :performances

  def self.add_performance
    
  end

end
