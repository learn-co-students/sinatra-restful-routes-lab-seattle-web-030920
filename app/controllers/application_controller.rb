class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #landing page
  get '/recipes' do 
    @recipes = Recipe.all 
    erb :index
  end 

  # create
  get '/recipes/new' do 
    erb :new
  end 

  post '/recipes' do 
    binding.pry
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

 #read 

  get '/recipes/:id' do 
    @recipe = Recipe.find(params[:id])
    erb :show 
  end

  #update

  get '/recipes/:id/edit' do 
    @recipe = Recipe.find(params[:id])
    erb :edit 
  end

  patch '/recipes/:id' do 
    @recipe = Recipe.find(params[:id])
    @recipe.update(params[:recipe])
    redirect to "/recipes/#{@recipe.id}"
  end 

  #delete

  delete '/recipes/:id' do 
    @recipe = Recipe.find(params[:id])
    @recipe.delete 
    redirect to "/recipes"
  end



end
