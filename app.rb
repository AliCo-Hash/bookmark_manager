require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/bookmark.rb'




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
    Bookmark.create(title: params[:title], url: params[:url])
    redirect'/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/update' do
    @bookmark_id = params[:id]
    erb :'bookmarks/update'
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end
  
  run! if app_file == $0
end