require 'bookmark'
require 'setup_test_database'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      set_up_table
      bookmarks = Bookmark.all
      expect(bookmarks).to be_empty
      drop_table
      #expect(bookmarks).to include("http://www.makersacademy.com")
      #expect(bookmarks).to include("http://www.google.com/")
    end 
  end
end