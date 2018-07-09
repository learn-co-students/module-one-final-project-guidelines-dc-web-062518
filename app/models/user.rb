class User < ActiveRecord::Base

  #:belongs to :book
  has_many :user_collections
  has_many :books, through: :user_collections

end
