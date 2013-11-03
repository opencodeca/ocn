module App
  class PostsController < AppController

    # GET /
    # GET /posts
    def index
      @posts = Post.popular(10)
    end

    # GET /posts/newest
    def newest
      @posts = Post.newest(10)

      render :index
    end

    # GET /posts/new
    def new
      @post = current_user.posts.build
    end

    # POST /posts/new
    def create
      @post = current_user.posts.build
      @post.assign_attributes(post_params)

      if @post.save
        redirect_to posts_newest_path, notice: t('.notice')
      else
        render :new
      end
    end

  private

    def post_params
      permitted_parameters = [:title, :url, :description]
      params.require(:post).permit(*permitted_parameters)
    end

  end
end
