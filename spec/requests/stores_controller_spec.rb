require 'rails_helper'

RSpec.describe StoresController, type: :request do
  let(:base_url) { "https://api.mapbox.com/geocoding/v5/mapbox.places"}

  describe '.category' do
    context "coffee" do
      before do
        stub_request(:get, "#{base_url}/coffee.json?&proximity=-77.032,38.912&types=poi&access_token=test_key").
          to_return(:headers => { 'Content-Type' =>'application/json' },
                    :body => JSON_DATA_COFFEE.to_json )
      end

      it 'searches coffee for the given latitude and longitude' do
        post "/stores/data", params: { poi: {category: "coffee", latitude: -77.032, longitude: 38.912 } }
        expect(json).to eq({:"20005"=>["Starbucks", "Starbucks_test"], :"20007"=>["differentCoffee"]})
      end
    end

    context "gallery" do
      before do
        stub_request(:get, "#{base_url}/gallery.json?&proximity=-77.032,38.912&types=poi&access_token=test_key").
          to_return(:headers => { 'Content-Type' =>'application/json' },
                    :body => JSON_DATA_GALLERY.to_json )
      end

      it 'searches gallery for the given latitude and longitude' do
        post "/stores/data", params: { poi: {category: "gallery" ,latitude: "-77.032", longitude: 38.912 } }
        expect(json).to eq({:"20005"=>["Gallery Plan B", "Gallery Plan D"], :"20009"=>["Gallery Plan R"]})
      end
    end

    context "api params validation" do
      before do
         allow(Mapbox::PoiCategories).to receive(:category).with('gallery',  {:proximity=>"-77.032,38.912"}).
         and_return({validation: 'test'})
       end

      it "validate when latitude is string" do
        post "/stores/data", params: { poi: {category: "gallery" ,latitude: "www", longitude: 38.912 } }
        expect(json[:errors]["latitude"]).to eq(["is not a number"])
      end

      it "validate when longitude is string" do
        post "/stores/data", params: { poi: {category: "gallery" ,latitude: -77.032, longitude: "www38.912" } }
        expect(json[:errors]["longitude"]).to eq(["is not a number"])
      end
    end
  end
end
