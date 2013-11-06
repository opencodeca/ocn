module App
  class ErrorsController < AppController
    include Gaffe::Errors
    layout 'application'

    def show
      render @rescue_response
    end
  end
end
