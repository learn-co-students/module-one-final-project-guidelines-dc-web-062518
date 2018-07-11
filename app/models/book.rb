class Book < ActiveRecord::Base

has_many :user_book_choices
has_many :users, through: :user_book_choices

end

# hillary = User.create(name: "Hillary")
# UserCollection.create(book_id: 4, user_id: 9)
