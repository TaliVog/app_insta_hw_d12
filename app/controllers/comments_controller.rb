class CommentsController < ApplicationController
	def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.create(comment_params)
    redirect_to @photo
  end
 
  def destroy
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.find(params[:id])
    @comment.destroy
    redirect_to photos_path
  end
 
  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
