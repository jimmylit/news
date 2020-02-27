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

  # take results from ask and find geo location
  
  location = params["location"]
  @results = Geocoder.search(params["location"])
  lat_long = @results.first.coordinates
  lat = lat_long[0]
  lng = lat_long[1]
  
  # Pass geo through Dark Sky
  
forecast = ForecastIO.forecast(lat, lng)

@weather_warning =  forecast["alerts"][0]["description"]

@weather_today = forecast

  # Pass geo through the news api hh


  # display weather forecast
 view "news"
end

 
 
