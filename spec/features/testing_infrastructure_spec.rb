feature 'Infrastructure' do
  scenario 'testing infrastructure is working' do
    visit '/'
    expect(page).to have_content("Hello World")
  end
end
