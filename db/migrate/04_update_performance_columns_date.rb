class UpdatePerformanceColumnsDate < ActiveRecord::Migration[5.0]
  def change
    change_column :performances, :date, :date
  end
end
