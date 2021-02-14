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
        redirect_to "https://new_front_end.com"
    end
    def getAll
        par = params.permit(:weatherStation,:timeSpan)
        js = WeatherStation.where(created_at: normalizeTime(par["timeSpan"])..Time.now,weatherStation:par["weatherStation"])
        render json: js.to_json
    end

    private
    def sensor_params
        params.require(:data).permit(:weatherStation, :temperatures, :humidity, :voltageBattery, :absolutePressure, :relativePressure, :dewPoint, :heatIndex, :zambrettisWords, :accuracyInPercents, :tendInWords, :dewPointSpread)
    end
end
