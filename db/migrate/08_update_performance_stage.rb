class UpdatePerformanceStage < ActiveRecord::Migration[5.0]
  def change
    change_column :performances, :stage, :integer
  end
end
