feature 'add bookmarks' do
  scenario 'user can add a bookmark to the database and view it' do
    visit '/'
    click_link "Add Bookmark"
    fill_in :url, with: "http://www.test.com"
    fill_in :title, with: "Test"
    click_button "Submit"

    expect(page).to have_link('Test', href: "http://www.test.com")
  end
end
