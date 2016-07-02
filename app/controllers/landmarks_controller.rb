class LandmarksController < ApplicationController

#new form
	get '/landmarks/new' do
  		erb :'/landmarks/new'
  	end
   
#create  
  	post '/landmarks' do
  		@landmark = Landmark.create(params[:landmark])
  		redirect to "/landmarks/#{@landmark.id}"
  	end

#index
	get '/landmarks' do
		@landmarks = Landmark.all
		erb :'/landmarks/index'
	end

#show
	get '/landmarks/:id' do

		@landmark = Landmark.find(params[:id])
		erb :'/landmarks/show'
	end

#edit part 1
	get '/landmarks/:id/edit' do
		@landmark = Landmark.find(params[:id]) 
		erb :'/landmarks/edit'
	end


#edit part 2
	patch '/landmarks/:id' do	
		@landmark = Landmark.find(params[:id])
		# @landmark.name.update(params[:landmark][:name])
		# @landmark.year_completed.update(params[:landmark][:year_completed])
		@landmark.update(params[:landmark])
		# @landmark.name = params[:name]
		# @landmark.year_completed = params[:year_completed].to_s
		@landmark.save
		redirect to "/landmarks/#{@landmark.id}"
	end

end


# LandmarksController
#   allows you to view form to create a new landmark (FAILED - 10)
#   allows you to create a new landmark (FAILED - 11)
#   allows you to list all landmarks (FAILED - 12)
#   allows you to see a single landmark (FAILED - 13)
#   allows you to view form edit a single landmark (FAILED - 14)
#   allows you to edit a single landmark (FAILED - 15)
#   creates checkboxes for all the landmarks and titles created on the Figures new page (FAILED - 16)