class BlogPostsController < ApplicationController
  def index
    @posts = BlogPost.all
    #render "index.html.erb"
  end

  def show
    @post = BlogPost.find(params[:id])
  end

  def new
      @post = BlogPost.new
  end

  def create
      @post = BlogPost.new(post_params)

      if @post.save
          redirect_to @post
      else
          render action: :new
      end
  end

    def delete
        @post = BlogPost.find(params[:id])

        if @post.destroy
            redirect_to all_posts_path
        else
            redirect_to blog_post_path(@post)
        end
    end

    private
    def post_params
        params
            .require(:blog_post)
            .permit(:title, :content)
    end
end
