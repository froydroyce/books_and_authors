class Book < ApplicationRecord
  validates_presence_of :title, :number_of_pages, :publication_year
  
  has_many :author_books
  has_many :authors, through: :author_books
end
