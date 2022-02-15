require 'bookmark'
require 'pg'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      bookmarks = Bookmark.all
      expect(bookmarks).to include("http://www.makersacademy.com") 
    end 
  end

  describe '.create' do
    it 'add a bookmark' do
      Bookmark.create('https://instagram.com')
      bookmarks = Bookmark.all 
      expect(bookmarks).to include('https://instagram.com')
    end
  end
end

