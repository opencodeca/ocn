module App
  class PostsController < AppController

    # GET /
    # GET /posts
    def index
      @posts = Post.newest(10)
    end

    # GET /posts/newest
    def newest
      @posts = Post.newest(10)
    end

  end
end
