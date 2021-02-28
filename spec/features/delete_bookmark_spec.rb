feature 'delete bookmark' do
  scenario 'user can delete a bookmark in the list' do
    Bookmark.create('https://www.facebook.com', 'Facebook')
    visit '/bookmarks'
    expect(page).to have_link('Facebook', href: 'https://www.facebook.com')

    click_button "Delete Facebook"

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Facebook', href: 'https://www.facebook.com')
  end
end
