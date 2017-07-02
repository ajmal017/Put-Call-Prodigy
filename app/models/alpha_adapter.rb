require 'httparty'

class AlphaAdapter
  include HTTParty

  def self.search(ticker)
    api_key = ALPHA_API
    up_function = 'TIME_SERIES_INTRADAY'
    up_ticker = ticker.upcase
    interval = 1
    url = "http://www.alphavantage.co/query?function=#{up_function}&symbol=#{up_ticker}&interval=#{interval}min&apikey=#{api_key}"
    response = HTTParty.get(url)
    fwm = response.parsed_response
    p fwm
  end
end


#NOTES-----------------------
# ENV['ALPHA_API']
# up_function = function.split.join('_').upcase
