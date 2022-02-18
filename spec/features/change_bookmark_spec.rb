feature 'Update bookmark' do
  scenario 'allows user to update an existing bookmark' do
    bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
    visit('/bookmarks')
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')

    first('.bookmark').click_button 'Update bookmark'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/update"
    
    fill_in('title', with: 'Instagram')
    fill_in('url', with: 'http://www.instagram.com')
    click_button 'Submit change'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Instagram', href: 'http://www.instagram.com')
  end
end