require 'open-uri'

class ForecastController < ApplicationController
  def coords_to_weather_form
    # Nothing to do here.
    render("coords_to_weather_form.html.erb")
end

def coords_to_weather
    @lat = params[:user_latitude]
    @lng = params[:user_longitude]

    # ==========================================================================
    # Your code goes below.
    # The latitude the user input is in the string @lat.
    # The longitude the user input is in the string @lng.
    # ==========================================================================

# APIKEY = "19d48afa13d3f3921cb021d54c4c0ce5"

url = "https://api.forecast.io/forecast/19d48afa13d3f3921cb021d54c4c0ce5/#{@lat},#{@lng}"

raw_data = open(url).read
parsed_data = JSON.parse(raw_data)

@current_temperature = parsed_data["currently"]["temperature"]

@current_summary = parsed_data["currently"]["summary"]

@summary_of_next_sixty_minutes = parsed_data["minutely"]["summary"]

@summary_of_next_several_hours = parsed_data["hourly"]["summary"]

@summary_of_next_several_days = parsed_data["daily"]["summary"]

render("coords_to_weather.html.erb")
end
end
