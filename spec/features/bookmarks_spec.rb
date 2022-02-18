require 'pg'

feature 'Test viewing bookmarks' do
  scenario 'should show list of bookmarks' do
    Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com' )
    visit('/bookmarks')
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
  end
end