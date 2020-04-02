require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/' do    
    redirect to '/recipes' 
  end

  get '/recipes' do
    @recipes = Recipe.all
    #binding.pry
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  get'/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    #binding.pry
    erb :show
  end

  post '/recipes' do
    @recipe = Recipe.create(params)
    #binding.pry
    redirect to "/recipes/#{@recipe.id}"
  end

  patch '/recipes/:id' do  #updates a recipe
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name.update(params[:name])
    @recipe.ingredients.update (params[:ingredients])
    @recipe.cook_time.update(params[:cook_time])
    
    redirect to "/recipes/#{@recipe.id}"
  end

  # patch '/recipe/:id' do
  #   @recipe = Recipe.find(params[:id])
  #   binding.pry
  #   @recipe.name.update(params[:name])
  #   @recipe.ingredients.update(params[:ingredients])
  #   @recipe.cook_time.update(params[:cook_time])
  #   redirect to "/recipe/#{@recipe.id}"
  # end


  delete '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end




end
