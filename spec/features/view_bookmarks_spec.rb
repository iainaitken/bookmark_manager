feature 'viewing bookmarks' do
  scenario 'user wants to see all of their bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Makers Academy'), ('http://www.destroyallsoftware.com', 'Destroy All Software'), ('http://www.google.com', 'Google');")
    # connection.exec("INSERT INTO bookmarks (url) VALUES;")
    # connection.exec("INSERT INTO bookmarks (url) VALUES;")

    visit '/bookmarks'

    expect(page).to have_link('Makers Academy', href: "http://www.makersacademy.com")
    expect(page).to have_link('Destroy All Software', href: "http://www.destroyallsoftware.com")
    expect(page).to have_link('Google', href: "http://www.google.com")
  end
end
