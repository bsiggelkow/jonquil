class WelcomeController < ApplicationController

	def index
    if session[:token]
      inbloom = rest_client
      @rest_home = JSON.parse inbloom['home'].get
      self_link = @rest_home['links'][0]['href']
      @self = JSON.parse api(self_link).get 
    end
	end

end