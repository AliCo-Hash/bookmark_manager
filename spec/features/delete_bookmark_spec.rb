feature 'delete bookmark' do
  scenario 'Allows user to delete bookmarks' do
  Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
  visit('/bookmarks')
  expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')

  first('.bookmark').click_button 'Delete bookmark'
  expect(current_path).to eq '/bookmarks'
  expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
  end
end