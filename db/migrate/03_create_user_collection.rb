class CreateUserCollection < ActiveRecord::Migration

  def change
    create_table :user_collections do |t|
      t.integer :book_id
      t.integer :user_id
    end
  end

end
