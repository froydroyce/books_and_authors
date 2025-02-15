class Author < ApplicationRecord
  validates_presence_of :name

  has_many :author_books
  has_many :books, through: :author_books

  def average_pages
    books.average(:number_of_pages)
  end
end
