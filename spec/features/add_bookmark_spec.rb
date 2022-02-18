feature 'testing adding bookmark' do
  scenario 'add bookmark confirmation' do
    visit '/bookmarks'
    fill_in('title', with: 'Instagram')
    fill_in 'url',with:'https://instagram.com'
    click_button 'Add New Bookmark'
    expect(page).to have_link('Instagram', href: 'https://instagram.com')
  end
end 