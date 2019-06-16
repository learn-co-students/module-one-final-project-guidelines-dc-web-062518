class CreatePerformances < ActiveRecord::Migration[5.0]
  def change
    create_table :performances do |t|
      t.datetime :date
      t.datetime :time
      t.string :stage
      t.timestamps
    end
  end
end
