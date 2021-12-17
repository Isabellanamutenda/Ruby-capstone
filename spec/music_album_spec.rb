require_relative 'spec_helper'

describe MusicAlbum do
  before :each do
    @album1 = MusicAlbum.new('King', { day: 30, month: 2, year: 2011 }, false)
    @album2 = MusicAlbum.new('Wonder', { day: 15, month: 9, year: 1998 }, true)
  end

  it 'checks if album_1 is an instance of the MusicAlbum class' do
    expect(@album1).to be_an_instance_of MusicAlbum
  end

  it 'checks if album_2 is an instance of the MusicAlbum class' do
    expect(@album2).to be_an_instance_of MusicAlbum
  end

  it 'confirms album_3 is not an instance of the MusicAlbum class' do
    expect(@album3).not_to be_an_instance_of MusicAlbum
  end

  it 'checks if album_1 name is king' do
    expect(@album1.name).to eq 'king'
  end

  it 'checks if album_2 name is not Carpe ' do
    expect(@album2.name).not_to be 'wonder'
  end

  it 'checks if album1 can be archived' do
    expect(@album1.can_be_archived?).to be_falsy
  end

  it 'checks if album2 can be archived' do
    expect(@album2.can_be_archived?).to be_truthy
  end

  it 'confirms that the on_spotify attribute of album1 is true' do
    expect(@album1.on_spotify).not_to be true
  end

  it 'confirms that the on_spotify attribute of album2 is true' do
    expect(@album2.on_spotify).to be true
  end

  it 'confirms that the published year of album1 is not 1978' do
    expect(@album1.publish_date[:year]).to be 2011
  end

  it 'confirms that the published year of album2 is not 2012' do
    expect(@album2.publish_date[:year]).not_to be 2012
  end
end
