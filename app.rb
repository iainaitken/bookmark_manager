require 'sinatra/base'
require './lib/bookmark'
require 'pg'

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override

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

  delete '/bookmarks/:id' do
    Bookmark.delete(params['id'])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark_id = params['id']
    erb :'bookmarks/edit'
  end

  patch '/bookmarks/:id' do
    p params

    connection = PG.connect(dbname: "bookmark_manager_test")
    connection.exec("UPDATE bookmarks SET url = '#{params[:url]}', title = '#{params[:title]}' WHERE id = #{params[:id]}")
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
