feature 'Update bookmarks' do
  scenario 'user can update a bookmark' do
    Bookmark.create("https://www.lostminute.com/", "LostMinute")
    visit '/bookmarks'
    expect(page).to have_link("LostMinute", href: "https://www.lostminute.com/")

    click_button "Edit LostMinute"
    # expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in :url, with: "https://www.lastminute.com/"
    fill_in :title, with: "LastMinute"
    click_button "Submit"

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link("LostMinute", href: "https://www.lostminute.com/")
    expect(page).to have_link("LastMinute", href: "https://www.lastminute.com/")
  end
end
