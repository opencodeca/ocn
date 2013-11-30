class App::ErrorsController < App::ApplicationController
  include Gaffe::Errors
  layout 'application'

  def show
    render @rescue_response
  end
end
