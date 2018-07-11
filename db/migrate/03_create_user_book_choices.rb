class CreateUserBookChoices < ActiveRecord::Migration[4.2]

  def change
    create_table :user_book_choices do |t|
      t.integer :book_id
      t.integer :user_id
    end
  end

end
