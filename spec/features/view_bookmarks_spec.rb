feature 'viewing bookmarks' do
  scenario 'user wants to see all of their bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content "https://www.ruby-lang.org/en/"
    expect(page).to have_content "https://rspec.info/"
    expect(page).to have_content "https://github.com/"
  end
end
