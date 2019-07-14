require 'rails_helper'

RSpec.describe 'Books Index' do
  describe 'As a visitor' do
    before(:each) do
      @paolo = Author.create!(name: "Paulo Coelho")
      @louis = Author.create!(name: "Louis Sachar")
      @the_alchemist = Book.create!(title: "The Alchemist", publication_year: 1988, number_of_pages: 208)
      @holes = Book.create!(title: "Holes", publication_year: 1998, number_of_pages: 265)
      @small_steps = Book.create!(title: "Small Steps", publication_year: 2006, number_of_pages: 257)
      @paolo.books << [@the_alchemist, @holes]
      @louis.books << [@holes, @small_steps]
      visit books_path
    end

    it "I see each book in the system including the books:\n
    -title\n
    -number of pages\n
    -publication year\n
    -the name of each author that wrote the book" do

      within("#book-#{@the_alchemist.id}") do
        expect(page).to have_content(@the_alchemist.title)
        expect(page).to have_content("Number of Pages: #{@the_alchemist.number_of_pages}")
        expect(page).to have_content("Publication Year: #{@the_alchemist.publication_year}")
        expect(page).to have_content(@paolo.name)
      end

      within("#book-#{@holes.id}") do
        expect(page).to have_content(@holes.title)
        expect(page).to have_content("Number of Pages: #{@holes.number_of_pages}")
        expect(page).to have_content("Publication Year: #{@holes.publication_year}")
        expect(page).to have_content(@paolo.name)
        expect(page).to have_content(@louis.name)
      end

      within("#book-#{@small_steps.id}") do
        expect(page).to have_content(@small_steps.title)
        expect(page).to have_content("Number of Pages: #{@small_steps.number_of_pages}")
        expect(page).to have_content("Publication Year: #{@small_steps.publication_year}")
        expect(page).to have_content(@louis.name)
      end
    end

    it "Clicking on a author's name will take me to their show page" do
      within("#book-#{@the_alchemist.id}") do
        expect(page).to have_link('Paulo Coelho')

        click_on 'Paulo Coelho'

        expect(current_path).to eq(author_path(@paolo))
      end

      visit books_path

      within("#book-#{@small_steps.id}") do
        expect(page).to have_link('Louis Sachar')

        click_on 'Louis Sachar'

        expect(current_path).to eq(author_path(@louis))
      end
    end
  end
end
