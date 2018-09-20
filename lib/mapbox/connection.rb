class Mapbox::Connection
  include HTTParty

  base_uri 'https://api.mapbox.com/geocoding/v5/mapbox.places'
  format :json
  default_timeout 1

  class << self

    def handle_caching(key)
      if cached = $redis.get(key)
        JSON[cached]
      else
        yield.tap do |results|
          $redis.set(key, results.to_json)
          $redis.expire key, 3600 # 1 hours
        end
      end
    end

    def access_token
      "access_token=#{ENV['access_token']}"
    end

    def handle_timeouts
      begin
        yield
      rescue Net::OpenTimeout, Net::ReadTimeout
        {}
      end
    end
  end
end
