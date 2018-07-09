class Book < ActiveRecord::Base

has_many :user_collections
has_many :users, through: :user_collections

end

# hillary = User.create(name: "Hillary")
# UserCollection.create(book_id: 4, user_id: 9)
