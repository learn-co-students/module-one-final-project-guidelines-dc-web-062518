class User < ActiveRecord::Base

  #:belongs to :book
  has_many :user_book_choices
  has_many :books, through: :user_book_choices

end
