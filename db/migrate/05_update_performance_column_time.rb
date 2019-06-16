class UpdatePerformanceColumnTime < ActiveRecord::Migration[5.0]
  def change
    change_column :performances, :time, :time
  end
end
