require 'bookmark'

describe Bookmark do
  it 'stores a list of bookmarks' do
    expect(Bookmark.all).to eq ["https://www.ruby-lang.org/en/", "https://rspec.info/", "https://github.com/"]
  end
end
