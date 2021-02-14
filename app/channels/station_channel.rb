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
    ws = WeatherStation.new args_hash
    if ws.save
      ClientChannel.broadcast_to(ws.weatherstation, {room: ws.weatherstation, data: ws})
    else
      ClientChannel.broadcast_to(ws.weatherstation, {room: ws.weatherstation, data: ws.errors})
    end
    "asdas"
  end

  private
	def sensor_params args
    args.require(:data).permit(:weatherstation, :temperatures, :humidity, :voltageBattery, :absolutePressure, :relativePressure, :dewPoint, :heatIndex, :zambrettisWords, :accuracyInPercents, :tendInWords, :dewPointSpread)
  end
end
