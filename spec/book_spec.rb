require_relative 'spec_helper'

RSpec.describe Book do
  before :each do
    @book1 = Book.new({ day: 25, month: 12, year: 1545 }, 'Amanda ngozi', 'women')
    @book2 = Book.new({ day: 20, month: 8, year: 1999 }, 'Napolin', 'up the hills')
    @book3 = Book.new({ day: 4, month: 7, year: 2000 }, 'Hill crest', 'women who code')
  end
  it 'Creates a Book object from parameters' do
    expect(@book1).to be_an_instance_of Book
    expect(@book2).to be_an_instance_of Book
    expect(@book3).to be_an_instance_of Book
  end

  it 'Check for the publisher of the book' do
    expect(@book1.publisher).to eql 'Amanda ngozi'
    expect(@book2.publisher).to eql 'Napolin'
  end

  it 'Check if the book is archivable' do
    expect(@book1.archivable).to be_truthy
    expect(@book2.archivable).to be_truthy
    expect(@book3.archivable).to be_falsey
  end
end
