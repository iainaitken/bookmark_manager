require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'stores a list of bookmarks' do
      bookmark = Bookmark.create('http://www.makersacademy.com', "Makers Academy")
      Bookmark.create('http://www.destroyallsoftware.com', "Destroy All Software")
      Bookmark.create('http://www.google.com', "Google")

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark['id']
      expect(bookmarks.first.title).to eq "Makers Academy"
      expect(bookmarks.first.url).to eq "http://www.makersacademy.com"
    end
  end

  describe '.create' do
    it 'can add a new bookmark to the database' do
      bookmark = Bookmark.create("http.cat", "HTTP Cat")

      expect(bookmark['url']).to eq("http.cat")
      expect(bookmark['title']).to eq("HTTP Cat")
    end
  end

  describe '.delete' do
    it 'deletes a bookmark' do
      bookmark = Bookmark.create("https://www.facebook.com", "Facebook")

      Bookmark.delete(bookmark['id'])

      expect(Bookmark.all.length).to eq 0
    end
  end

  describe '.update' do
    it 'updates a bookmark' do
      bookmark = Bookmark.create("https://www.lostminute.com", "LostMinute")

      updated_bookmark = Bookmark.update(bookmark['id'], "https://www.lastminute.com", "LastMinute")

      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark['id']
      expect(updated_bookmark.url).to eq "https://www.lastminute.com"
      expect(updated_bookmark.title).to eq "LastMinute"
    end
  end

  describe '.find' do
    it 'finds a specific bookmark in the database' do
      bookmark = Bookmark.create("http.cat", "HTTP Cat")

      result = Bookmark.find(bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq "HTTP Cat"
      expect(result.url).to eq "http.cat"
    end
  end

end
