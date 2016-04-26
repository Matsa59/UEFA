class CountriesController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!


  def index_admin
    @countries = Country.all
  end

  def create
    @country = Country.new(country_params)

    @country.save
    redirect_to index_admin
  end

  def new

  end

  def remove

  end

  private
  def country_params
    params.require(:country).permit(:name)
  end
end
