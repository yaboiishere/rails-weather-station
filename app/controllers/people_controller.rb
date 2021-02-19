class PeopleController < ApplicationController
  def index
    render json: Person.all().to_json
  end
  def show
    args = params.require(:id)
    render Person.where(:id => args.id).all().to_json
  end
  def update
    args = params.require(:id).permit(:approved, :owner)
    resp = Person.update(id = args.id, args)
    render json: resp.to_json
  end

  def approved_people
    render Person.where(:approved => true).all().to_json
  end
end