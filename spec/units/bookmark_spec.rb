require 'bookmark'

describe Bookmark do
  describe '#all' do
    it 'stores a list of bookmarks' do
      bookmark = Bookmark.create('http://www.makersacademy.com', "Makers Academy")
      Bookmark.create('http://www.destroyallsoftware.com', "Destroy All Software")
      Bookmark.create('http://www.google.com', "Google")

      bookmarks = Bookmark.all

      p "bookmark is #{bookmark}"
      p "bookmarks is #{bookmarks}"

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark['id']
      expect(bookmarks.first.title).to eq "Makers Academy"
      expect(bookmarks.first.url).to eq "http://www.makersacademy.com"
    end
  end

  describe '#create' do
    it 'can add a new bookmark to the database' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      bookmark = Bookmark.create("http.cat", "HTTP Cat")

      p bookmark

      expect(bookmark['url']).to eq("http.cat")
      expect(bookmark['title']).to eq("HTTP Cat")
    end
  end
end
