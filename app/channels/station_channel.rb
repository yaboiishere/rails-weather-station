class StationChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    if params[:token] != ENV["token"]
      return "Unauthorised access"
    else
      stream_from "station_channel"
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def create args
    puts args
    args_hash = JSON.parse(args["data"])
    WeatherStation.create! args_hash
    "asdas"
  end

  private
	def sensor_params arg
    arg.require(:data).permit(:weatherstation, :temperatures, :humidity, :voltageBattery, :absolutePressure, :relativePressure, :dewPoint, :heatIndex, :zambrettisWords, :accuracyInPercents, :tendInWords, :dewPointSpread)
  end
end
