require 'sinatra/base'
require './lib/bookmark'
require 'pg'

class BookmarkManager < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks' do
    Bookmark.create(params[:url], params[:title]) if params[:url] != ""
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @list = Bookmark.all
    erb :bookmarks
  end

  run! if app_file == $0
end
