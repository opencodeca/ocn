module App
  class PostsController < AppController

    # GET /
    # GET /posts
    def index
      @links = Post.newest(10)
    end

    # GET /posts/newest
    def newest
      @links = Post.newest(10)
    end

  end
end
