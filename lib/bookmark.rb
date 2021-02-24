class Bookmark
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec('SELECT * FROM bookmarks')
    result.map do |bookmark|
      Bookmark.new(bookmark['id'], bookmark['title'], bookmark['url'])
    end
  end

  def self.create(url, title)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}') RETURNING id, title, url")
    return result[0]
  end

  attr_reader :id, :title, :url

  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url
  end

end
