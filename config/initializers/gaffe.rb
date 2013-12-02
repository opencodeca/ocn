# Configure Gaffe to handle errors
Gaffe.configure do |c|
  c.errors_controller = App::ErrorsController
end

Gaffe.enable!
