require 'sinatra/base'
require 'sinatra/reloader'
require 'bookmark'




class Bookmark_manager < Sinatra::Base 
  configure :development do 
    register Sinatra::Reloader 
  end
  enable :sessions, :method_override
  

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  post '/add_bookmark' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect'/bookmarks'
  end

  delete '/delete_bookmarks/:id' do
    onnection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec_params("DELETE FROM bookmarks WHERE id = $1", [params[:id]])
    redirect '/bookmarks'
  end
  

  run! if app_file == $0
end