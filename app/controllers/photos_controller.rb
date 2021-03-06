class PhotosController < ApplicationController
	before_action :authenticate_user!

	def create
		@place = Place.find(params[:place_id])
		@place.photos.create(photo_parmas.merge(user: current_user))
		redirect_to place_path(@place)
	end

	private

	def photo_parmas
		params.require(:photo).permit(:caption, :picture)
	end
end
