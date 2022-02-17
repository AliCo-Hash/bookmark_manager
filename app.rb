require 'sinatra/base'
require 'sinatra/reloader'
require 'bookmark'




class Bookmark_manager < Sinatra::Base 
  configure :development do 
    register Sinatra::Reloader 
  end
  

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


  

  run! if app_file == $0
end