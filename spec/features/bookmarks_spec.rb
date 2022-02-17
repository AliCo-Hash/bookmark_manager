require 'pg'

feature 'Test viewing bookmarks' do
  scenario 'should show list of bookmarks' do
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit('/bookmarks')
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
  end
end