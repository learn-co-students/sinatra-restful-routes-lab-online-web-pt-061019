class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/new' do
    erb :new
  end

  get 'recipe/:id' do
    @recipe = Receip.find_by_id(params[:id])
  end



end
