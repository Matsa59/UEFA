class CountriesController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!, :admin_require

  def index_admin
    @countries = Country.order(:name => :asc).paginate(:page => params[:page]);
  end

  def create
    @country = Country.new(country_params)

    @country.save
    redirect_to :country_admin_index
  end

  def new

  end

  def edit
    @country = Country.find(params[:id])
  end

  def update
    @country = Country.find(params[:id])

    if @country.update(country_params)
      redirect_to :country_admin_index
    else
      render 'edit'
    end
  end

  def destroy
    @country = Country.find(params[:id])
    @country.destroy

    redirect_to :country_admin_index
  end

  private
  def country_params
    params.require(:country).permit(:name, :description, :image)
  end
end
