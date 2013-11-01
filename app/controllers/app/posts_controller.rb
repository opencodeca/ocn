module App
  class PostsController < AppController

    # GET /
    # GET /posts
    def index
      @links = Post.newest(10)
    end

  end
end
