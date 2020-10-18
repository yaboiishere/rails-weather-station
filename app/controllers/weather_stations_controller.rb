class WeatherStationsController < ApplicationController

    def create 
        weatherStation.create(sensor_params)
    end

    private
    def sensor_params
        params.require(:data).permit(:weatherstation, :temperatures, :humidity, :voltageBattery, :absolutePressure, :relativePressure, :dewPoint, :heatIndex, :zambrettisWords, :accuracyInPercents, :tendInWords, :dewPointSpread)
    end
end
