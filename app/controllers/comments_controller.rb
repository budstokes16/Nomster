class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@place = Place.find(params[:place_id])
		@place.comments.create(comment_parmas.merge(user: current_user))
		redirect_to place_path(@place)
	end

	private

	def comment_parmas
		params.require(:comment).permit(:message, :rating)
	end
end
