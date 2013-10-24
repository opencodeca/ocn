module App
  class LinksController < AppController

    # GET /
    # GET /links
    def index
      @links = Link.newest(10)
    end

  end
end
