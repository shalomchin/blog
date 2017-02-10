class CommentsController < ApplicationController
  def new
        @post = Post.find(params[:post_id])
        @comment = @posts.comments.build 
    end

    def index
        @post = Post.find(params[:post_id])
        @comments = @post.comments.all
    end

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new(comment_params)
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
          flash[:notice] = "Destroyed homie ! "
          redirect_to post_path(@post)
        end


    # def show
    #     @post = Post.find(params)

      private
        def comment_params
          params.require(:comment).permit(:comment, :name, :email)
        end
    end
