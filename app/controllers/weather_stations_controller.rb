class WeatherStationsController < ApplicationController

    def create 
        ws = WeatherStation.new(sensor_params)
        if ws.save
            ClientChannel.broadcast_to(ws.weatherStation, {room: ws.weatherStation, data: ws})
        else
            ClientChannel.broadcast_to(ws.weatherStation, {room: ws.weatherStation, data: ws.errors})
        end
    end
    def index
        puts "index"
    end

    private
    def sensor_params
        params.require(:data).permit(:weatherStation, :temperatures, :humidity, :voltageBattery, :absolutePressure, :relativePressure, :dewPoint, :heatIndex, :zambrettisWords, :accuracyInPercents, :tendInWords, :dewPointSpread)
    end
end
