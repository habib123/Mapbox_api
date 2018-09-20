class StoresController < ApplicationController

  def index
   render component: 'Poi'
  end

  def data
    map_box_api_model = Mapbox::MapboxApi.new(params_mapbox_api)
    if map_box_api_model.valid?
      data = Mapbox::PoiCategories.category(category, proximity: proximity)
      render json: data
    else
      render json: { errors: map_box_api_model.errors.messages }, :status => 422
    end
  end

  private

   def params_mapbox_api
      params.require(:poi).permit(:latitude, :longitude, :category)
   end

   def category
     params[:poi][:category]
   end

   def proximity
     "#{params[:poi][:latitude]},#{params[:poi][:longitude]}"
   end
end
