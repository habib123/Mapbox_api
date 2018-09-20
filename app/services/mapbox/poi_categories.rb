module Mapbox
  class PoiCategories

    def self.category(category, query = {})
      response = Mapbox::Request.where(category, query.merge(types: 'poi'))
      postcode_arr = []
      response.fetch('features',[]).map do  |feature|
        feature.fetch('context',[]).map do |cotx|
          if cotx.fetch('id','').include? 'postcode'
            postcode_arr << [ cotx.fetch('text',''),feature.fetch('text','') ]
          end
        end
        response = Hash[postcode_arr.group_by(&:first).map{ |k,a| [k,a.map(&:last)] } ]
      end
      response
    end
  end
end
