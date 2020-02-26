require "sinatra"
require "sinatra/reloader"
require "geocoder"
require "forecast_io"
require "httparty"
def view(template); erb template.to_sym; end
before { puts "Parameters: #{params}" }                                     

# enter your Dark Sky API key here
ForecastIO.api_key = "39d13212312667e287d10d692b2a4f66"

get "/" do
  view "ask"
end

get "/news" do
  # take reslts from ask
  location =  params["location"]

  # Find geo location
  geocoder.

  # Pass geo through Dark Sky

  # Pass geo through the news api hh


  # display weather forecast
  # something new
  #hello hello

end