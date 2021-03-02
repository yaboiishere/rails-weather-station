class ManagementChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from ManagementChannel
    if Opt.where(name: "managementLock").last.value == "false"
      Opt.where(name: "managementLock").update(value: params[:username])
      broadcast_to("management_channel", message: { status: "locked successfully", locked: true })
    else
      broadcast_to("management_channel", message: { status: "already locked", locked: true })
    end
  end

  def receive(data)
    ActionCable.server.broadcast(ManagementChannel, data)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    # stream_from "management_channel"
    # if Opt.where(name: "managementLock").last.value == params[:username]
    #   Opt.create(name: "managementLock", value: "false")
    #   broadcast_to("management_channel", message: { status: "unlocked successfully", locked: false })
    # end
  end
end
