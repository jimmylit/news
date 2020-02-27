require "sinatra"
require "sinatra/reloader"
require "geocoder"
require "forecast_io"
require "httparty"
require "news-api"

def view(template); erb template.to_sym; end
before { puts "Parameters: #{params}" }                                     

# enter your Dark Sky API key here
ForecastIO.api_key = "39d13212312667e287d10d692b2a4f66"

# enter News API and create hash


# Navigation
get "/" do
   view "ask"
 end

get "/news" do

  # take results from ask and find geo location
  
  @location = params["location"]
  @results = Geocoder.search("@location")
  lat_long = @results.first.coordinates
  lat = lat_long[0]
  lng = lat_long[1]
  
  # Pass geo through Dark Sky
  
@forecast = ForecastIO.forecast(lat, lng)

@weather_warning =  @forecast["alerts"][0]["description"]

@current_temperature = @forecast["currently"]["temperature"]

@current_conditions = @forecast["currently"]["summary"]

  # Pass geo through the news api hh

newsapi = News.new("4f457608f9fa48c4824b5980c83ed2d2")    
url = "http://newsapi.org/v2/top-headlines?country=us&apiKey=4f457608f9fa48c4824b5980c83ed2d2"
@news = HTTParty.get(url).parsed_response.to_hash


# puts @news

  # display weather forecast

  view "news"
end

 
 
