
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to '/articles'
  end

  get '/articles' do
    @articles = Article.all
    erb :new
  end

  get '/articles/new' do
    @article = Article.new
    erb :new
  end

  post '/articles' do
    Article.create(title:params[:title])
  end
end
