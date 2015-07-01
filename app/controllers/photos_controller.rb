class PhotosController < ApplicationController
	before_action :authenticate_user!

	def index
		# find appropriate user and show all his public AND private pics
		if current_user.id == params[:user_id].to_i
			@photos = current_user.photos
		else
			redirect_to root_path
		end
	end

	def show_all
		# @photos = Photo.all
		# @photo = Photo.find(params[:photo_id])
		@photos = Photo.where(public: true)
	end


	def new
		@photo = current_user.photos.build
	end

	def create
		@photo = current_user.photos.build(photo_params)
		if @photo.save
			redirect_to @photo
		else
			render 'new'
		end
	end

	def show
		@photo = Photo.find(params[:id])
	end 

	def edit
		@photo = Photo.find(params[:id])
	end

	def update
		@photo = current_user.photos.find(params[:id])
			if @photo.update(photo_params)
				redirect_to @photo
			else
				render 'edit'
			end
	end

	def destroy
		@photo = Photo.find(params[:id])
		@photo.destroy
		redirect_to photos_path
	end 

		private
	def photo_params
		params.require(:photo).permit(:public, :caption, :image)
	end
end