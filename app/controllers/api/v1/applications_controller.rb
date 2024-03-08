class Api::V1::ApplicationsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :cancel, :select_match, :schedule_interview, :schedule_virtual_meet_greet, :schedule_adoption_day, :matches]
  before_action :check_adopter!, only: [:create, :cancel, :select_match, :schedule_interview, :schedule_virtual_meet_greet, :schedule_adoption_day, :matches]

  def new
  end

  def create
  end

  def show
  end

  def index
  end

  def cancel
  end

  def select_match
  end

  def schedule_interview
  end

  def schedule_virtual_meet_greet
  end

  def schedule_adoption_day
  end

  def matches
  end

end
