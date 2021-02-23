class WeatherStationsController < ApplicationController

    def create 
        ws = WeatherStation.new(sensor_params)
        if ws.save
            # ClientChannel.broadcast_to(ws.weatherStation, {room: ws.weatherStation, data: ws})
            ActionCable.server.broadcast("client_channel_#{ws.weatherStation}", {room: ws.weatherStation, data: ws})
            unless Person.where(:weather_station => ws.weatherStation).exists?
                Person.create(:weather_station => ws.weatherStation)
            end
        else
            # ClientChannel.broadcast_to(ws.weatherStation, {room: ws.weatherStation, data: ws.errors})
            ActionCable.server.broadcast("client_channel_#{ws.weatherStation}", {room: ws.weatherStation, data: ws.errors})
            # ActionCable.server.broadcast("client_channel_3", {room: 3, "data":{ "id":11, "weatherStation":3, "temperatures":9.99, "humidity":43.08, "voltageBattery":4.15, "absolutePressure":1018.06, "relativePressure":1028.0, "dewPoint":-1.99, "heatIndex":9.99, "zambrettisWords":"Сравнително добро, вероятен дъжд по - късно", "accuracyInPercents":94, "tendInWords":"бавно пада", "dewPointSpread":11.98, "created_at":"2021-02-15 09:19:30", "updated_at":"2021-02-15 09:19:30" }})
        end
    end
    def index
      redirect_to "https://yaboiishere.github.io/react-weather-station"
      # redirect_to "https://react-weather-station.herokuapp.com"
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
    def normalizeTime(str)
        eval(str)
    end
end
