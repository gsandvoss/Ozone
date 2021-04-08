class HomeController < ApplicationController
  def index
  	require 'net/http'
  	require 'json'


  	@url = 'https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=~zipCode~&distance=25&API_KEY=A66CD3ED-A8F4-4584-BEC8-9D24DA26A6E6'
  	@uri = URI(@url)
  	@response = Net::HTTP.get(@uri)
  	@output = JSON.parse(@response)
  end
end
