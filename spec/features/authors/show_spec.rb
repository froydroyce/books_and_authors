require 'rails_helper'

RSpec.describe 'Author Show Page' do
  describe 'As a visitor' do
    before(:each) do
      @paolo = Author.create!(name: "Paulo Coelho")
      @louis = Author.create!(name: "Louis Sachar")
      @the_alchemist = Book.create!(title: "The Alchemist", publication_year: 1988, number_of_pages: 208)
      @holes = Book.create!(title: "Holes", publication_year: 1998, number_of_pages: 265)
      @small_steps = Book.create!(title: "Small Steps", publication_year: 2006, number_of_pages: 257)
      @paolo.books << [@the_alchemist, @holes]
      @louis.books << [@holes, @small_steps]
    end

    it "I see the author with that id including the author's:\n
    -Name\n
    -Title of each book they have written\n
    -Average number of pages for all their books" do
      visit author_path(@paolo)

      expect(page).to have_content(@paolo.name)
      expect(page).to have_content(@the_alchemist.title)
      expect(page).to have_content(@holes.title)
      expect(page).to have_content(236.5)

      visit author_path(@louis)

      expect(page).to have_content(@louis.name)
      expect(page).to have_content(@holes.title)
      expect(page).to have_content(@small_steps.title)
      expect(page).to have_content(261)
    end
  end
end
