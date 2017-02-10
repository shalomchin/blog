class CommentsController < ApplicationController

def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    if @comment.save
        redirect_to post_path(@post)
    else
        flash[:notice] = "* Unable to create the comment !"
        redirect_to post_path(@post)
    end
 end

 def destroy
 	@post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    
    redirect_to post_path(@post)
 end


  private
    def comment_params
      params.require(:comment).permit(:comment, :name, :email)
    end
end
