class App::PostsController < App::ApplicationController
  before_action :ensure_current_user, only: [:create, :like, :new]
  before_action :fetch_post, only: [:show, :like, :destroy]

  # GET /
  # GET /posts
  def popular
    @posts = Post.popular.page(params[:page]).includes(:user)

    respond_to do |format|
      format.html

      # /posts/popular.rss
      format.rss{ render layout: false }
    end
  end

  # GET /posts/newest
  def newest
    @posts = Post.newest.page(params[:page]).includes(:user)

    respond_to do |format|
      format.html

      # /posts/newest.rss
      format.rss{ render layout: false }
    end
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
      current_user.like_post!(@post)
      redirect_to newest_app_posts_path, notice: t('.notice')
    else
      render :new
    end
  end

  # GET /posts/:id
  def show
    @comments = @post.comments.popular
    @comment = @post.comments.build(commenter: current_user)
  end

  # DELETE /posts/:id
  def destroy
    action = PostDeleter.new(current_user, @post).run!

    if action
      redirect_to :back
    else
      redirect_to :back, notice: t('.unauthorized')
    end
  end

  # POST /posts/:id/like
  def like
    current_user.like_post!(@post)
    redirect_to :back
  end

private

  def fetch_post
    @post = Post.friendly.find(params[:id])
  end

  def post_params
    permitted_parameters = [:title, :url, :description]
    params.require(:post).permit(*permitted_parameters)
  end
end
