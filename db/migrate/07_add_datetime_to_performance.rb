class AddDatetimeToPerformance < ActiveRecord::Migration[5.0]
  def change
    add_column :performances, :time, :datetime
  end
end
