class RemovePerformancesDateAndTimeColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :performances, :date
    remove_column :performances, :time
  end
end
