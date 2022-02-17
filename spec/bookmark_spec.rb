require 'bookmark'
require 'pg'
require 'database_helpers'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      conn = PG.connect(dbname: 'bookmark_manager_test')

      bookmark = Bookmark.create(url: "http://www.makersacademy.com",title: "Makers Academy")
      Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmark.create(url: "http://www.google.com", title: "Google")
      
      bookmarks = Bookmark.all
      
      expect(bookmarks.length).to eq 3  
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end 
  end

  describe '.create' do
    it 'add a bookmark' do
      bookmark = Bookmark.create(url: 'https://instagram.com', title: 'Instagram')
      persisted_data = persisted_data(id: bookmark.id) 
      #bookmarks = Bookmark.all 
      expect(bookmark).to be_a Bookmark 
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Instagram'
      expect(bookmark.url).to eq 'https://instagram.com'
    end
  end
end

