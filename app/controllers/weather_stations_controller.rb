class WeatherStationsController < ApplicationController

    def create 
        ws = WeatherStation.new(sensor_params)
        if ws.save
            ClientChannel.broadcast_to(ws.weatherstation, {room: ws.weatherstation, data: ws})
        else
            ClientChannel.broadcast_to(ws.weatherstation, {room: ws.weatherstation, data: ws.errors})
        end
    end
    def index
        puts "index"
    end

    private
    def sensor_params
        params.require(:data).permit(:weatherstation, :temperatures, :humidity, :voltageBattery, :absolutePressure, :relativePressure, :dewPoint, :heatIndex, :zambrettisWords, :accuracyInPercents, :tendInWords, :dewPointSpread)
    end
end
