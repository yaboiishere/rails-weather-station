module ApplicationCable
  class Connection < ActionCable::Connection::Base
    # identified_by :wsId

    # def connect
    #   self.wsId = params["wsId"] if params[:token] == ENV["station_token"]
    # end

  end
end
