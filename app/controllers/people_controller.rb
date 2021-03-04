class PeopleController < ApplicationController
  skip_before_action :authenticate_request, :only => :approved_people

  def index
    preloaded_people = Person.includes(:user).map do |person|
      preloaded_person = person.attributes
      preloaded_person[:user] = person.user
      preloaded_person
    end
    render json: preloaded_people.to_json
  end

  def show
    args = params.require(:id)
    preloaded_people = Person.includes(:user).where(:id => args.id).map do |person|
      preloaded_person = person.attributes
      preloaded_person[:user] = person.user
      preloaded_person
    end
    render json: preloaded_people.to_json
  end

  def update
    args = params.permit(:id, :approved, :weather_station)
    resp = Person.update(id = args.id, args)
    render json: resp.to_json
  end

  def approved_people
    preloaded_people = Person.includes(:user).where(:approved => true).map do |person|
      preloaded_person = person.attributes
      preloaded_person[:user] = person.user
      preloaded_person
    end
    render json: preloaded_people.to_json
  end

  def unapproved_people
    preloaded_people = Person.includes(:user).where(:approved => false).map do |person|
      preloaded_person = person.attributes
      preloaded_person[:user] = person.user
      preloaded_person
    end
    render json: preloaded_people.to_json
  end
end