require 'pg'

feature 'Test viewing bookmarks' do
  scenario 'should show list of bookmarks' do
   visit('/bookmarks')
    expect(page).to have_content "http://www.makersacademy.com"
  end
end