class Mapbox::Request < Mapbox::Connection
  class << self

    def where(path, query = {})
      response = get_json(path, query)
    end

    def get_json(category_path, query = {})
      query_string = query.map{|k,v| "#{k}=#{v}"}.join("&")
      path = query.empty? ? "" : "#{category_path}.json?&#{query_string}"
      response = self.handle_timeouts do
        key = category_path+query_string
        self.handle_caching(key) do
          get("/#{path}&#{self.access_token}")
        end
      end
      response
    end
  end
end
