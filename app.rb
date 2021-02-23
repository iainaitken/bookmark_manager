require 'sinatra/base'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @list = Bookmark.all
    erb :bookmarks
  end

  run! if app_file == $0
end
