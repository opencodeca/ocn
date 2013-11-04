module App
  class PostsController < AppController
    before_action :fetch_post, only: [:show]

    # GET /
    # GET /posts
    def popular
      @posts = Post.popular(10)
    end

    # GET /posts/newest
    def newest
      @posts = Post.newest(10)
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

    # GET /posts/:id
    def show
    end

  private

    def fetch_post
      @post = Post.find_by_id(params[:id])

      redirect_to root_path unless @post
    end

    def post_params
      permitted_parameters = [:title, :url, :description]
      params.require(:post).permit(*permitted_parameters)
    end

  end
end
