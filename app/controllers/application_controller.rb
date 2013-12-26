class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  
  def rest_client
    raise ArgumentError, 'Expecting session[:token] to exist' unless session[:token]
    RestClient::Resource.new REST_URL, :headers => header
  end

  def api(uri=nil)
    raise ArgumentError, 'Expecting session[:token] to exist' unless session[:token]
    RestClient::Resource.new uri, :headers => header
  end

  def header
    @header ||= {
      :Content_Type => 'application/vnd.slc+json', 
      :Accept => 'application/vnd.slc+json', 
      :Authorization => 'bearer ' + session[:token]
    }
  end

end
