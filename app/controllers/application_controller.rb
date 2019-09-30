class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/' do
    redirect '/recipes'
  end

  get '/recipes' do
    @recipes = Recipes.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    recipe = Recipe.new(params)
    if recipe.save
      redirect "recipes/#{recipe.id}"
    else
      redirect '/recipes/new'
    end
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    if @recipe
      erb :show
    else
      redirect '/recipes'
    end
  end

  get '/recipes/:id/edit' do  #load edit form
  	@recipe = Recipe.find_by_id(params[:id])
      erb :edit
  end
  	 
  patch '/recipes/:id' do #edit action
    recipe = Recipe.find(params[:id]).tap do |recipe|
      recipe.update(
        name: params[:name],
        ingredients: params[:ingredients],
        cook_time: params[:cook_time]
      )
    
    redirect to "/recipees/#{@recipe.id}"
  end
end

  delete '/recipes/:id/delete' do
    Recipe.find(params[:id]).destroy
    redirect '/recipes'
  end
end

