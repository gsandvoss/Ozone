class HomeController < ApplicationController
  def index
  	require 'net/http'
  	require 'json'

  	@url = 'https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=99205&distance=25&API_KEY=A66CD3ED-A8F4-4584-BEC8-9D24DA26A6E6'
  	@uri = URI(@url)
  	@response = Net::HTTP.get(@uri)
  	@output = JSON.parse(@response)
  	#check for empty return results
  	if @output.empty?
  		@final_output = "Error"
  	else
  		@final_output = @output [0]['AQI']
  	end
  	#<h1 class="display-4"><%= @final_output%></h1>
  	if @final_output == "Error"
  		@api_color = "grey"
  	elsif @final_output <= 50
  		@api_color = "green"
  		@api_description = "Good, go outside and breathe!"
  	elsif @final_output >= 51 && @final_output <= 100
  		@api_color = "yellow"
  		@api_description = "Moderate, it's not too bad."
   	elsif @final_output >= 101 && @final_output <= 150
  		@api_color = "orange"
  		@api_description = "Unhealthy for Sensitive Groups"
   	elsif @final_output >= 151 && @final_output <= 200
  		@api_color = "red"
  		@api_description = "Unhealthy"
   	elsif @final_output >= 201 && @final_output <= 300
  		@api_color = "purple"
  		@api_description = "Very Unhealthy"
  	elsif @final_output >= 301 && @final_output <= 500
  		@api_color = "maroon"
  		@api_description = "Hazardous"
  	end
  end
end
