class FiguresController < ApplicationController
  #new
  get '/figures/new' do
    erb :'/figures/new'
  end

  #create
  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params[:landmark][:name].empty?
      @landmark = Landmark.create(params[:landmark])
      @figure.landmarks <<  @landmark
      @figure.save
    end

    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title]) 
      @figure.save
    end

    #
    redirect to "/figures/#{@figure.id}"
  end

  #index
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index' 
  end
  # THIS MIGHT NOT WORK WITH A / AT THE END OF GET & BROWSWER, TRY ADDING THE / AND THEN REMOVING /

  #show
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"/figures/show"
  end

  #edit part 1
  get '/figures/:id/edit' do 
    @figure=Figure.find(params[:id])
    erb :'/figures/edit'
  end

  #edit part 2
  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])    
    @figure.landmarks << Landmark.create(param[:landmark])
 
    # @figure.landmark = params[:landmark] HOW TO EDIT THE OTHER ATTRIBUTES
    @figure.save
    erb :show
    # redirect "/figures/#{@figure.id}"
    # erb :"/figures/show"  use redirect
  end
end


# FiguresController
#   allows you to view form to create a new figure (FAILED - 1)
#   allows you to create a new figure with a title (FAILED - 2)
#   allows you to create a new figure with a landmark (FAILED - 3)
#   allows you to create a new figure with a new title (FAILED - 4)
#   allows you to create a new figure with a new landmark (FAILED - 5)
#   allows you to list all figures (FAILED - 6)
#   allows you to see a single Figure (FAILED - 7)
#   allows you to view form to edit a single figure (FAILED - 8)
#   allows you to edit a single figure (FAILED - 9)

