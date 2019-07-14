require 'rails_helper'

describe Book, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :number_of_pages }
    it { should validate_presence_of :publication_year }
  end

  describe 'Relationships' do
    it { should have_many :author_books}
    it { should have_many :authors }
  end
end
