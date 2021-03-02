class OptsController < ApplicationController
  def last_lock_user
    render json: { user: Opt.where(name: "managementLock").first_or_create({ name: "managementLock", value: "false" }).value }
  end

  def update_last_lock_user
    if Opt.where(name: "managementLock").first_or_create({ name: "managementLock", value: "false" }).value == params[:user]
      Opt.where(name: "managementLock").last.update(value: "false")
      ManagementChannel.broadcast_to(ManagementChannel, message: { status: "unlocked", locked: false })
      render json: { user: "false" }
    else
      render json: { user: Opt.where(name: "managementLock").last.value }, status: 400
    end
  end
end
