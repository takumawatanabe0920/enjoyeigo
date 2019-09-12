class Teachers::PrefecturesController < ApplicationController
  def index
    prefecture = Prefecture.find(params[:prefecture_id])
    station_line = Station.where(prefecture_id: prefecture.id).includes(:station_line).map {|s| s.station_line}
    render json: station_line.select(:id, :name)
    #station = station_line.try(:station)
    #render json: station.select(:id, :name)
  end
end
