feature 'Infrastructure' do
  scenario 'testing infrastructure is working' do
    visit '/'
    expect(page).to have_content("Bookmark Manager")
  end
end
