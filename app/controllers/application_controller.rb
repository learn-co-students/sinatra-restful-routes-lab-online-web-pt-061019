class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get "/" do
    redirect '/recipes'
  end

  get '/recipes' do
    @recipes = Recipes.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end



end
