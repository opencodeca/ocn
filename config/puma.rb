threads 8,32
workers ENV['RACK_ENV'] == 'development' ? 1 : 3
