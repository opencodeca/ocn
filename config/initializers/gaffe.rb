if defined?(Gaffe)
  Gaffe.configure do |config|
    config.errors_controller = App::ErrorsController
  end

  Gaffe.enable!
end
