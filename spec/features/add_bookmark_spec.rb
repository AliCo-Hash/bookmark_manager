feature 'testing adding bookmark' do
  scenario "add bookmark" do
    visit '/bookmarks'
    expect(page).to have_field("url")
    expect(page).to have_selector(:link_or_button, "Add New Bookmark") 
  end
end 