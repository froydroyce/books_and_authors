require 'rails_helper'

describe Author, type: :model do
  before(:each) do
    @paolo = Author.create!(name: "Paulo Coelho")
    @louis = Author.create!(name: "Louis Sachar")
    @the_alchemist = Book.create!(title: "The Alchemist", publication_year: 1988, number_of_pages: 208)
    @holes = Book.create!(title: "Holes", publication_year: 1998, number_of_pages: 265)
    @small_steps = Book.create!(title: "Small Steps", publication_year: 2006, number_of_pages: 257)
    @paolo.books << [@the_alchemist, @holes]
    @louis.books << [@holes, @small_steps]
  end

  describe 'Validations' do
    it { should validate_presence_of :name }
  end

  describe 'Relationships' do
    it { should have_many :author_books}
    it { should have_many :books }
  end

  describe 'Instance Methods' do
    it ".average_pages" do
      expect(@paolo.average_pages).to eq(236.5)
      expect(@louis.average_pages).to eq(261)
    end
  end
end
