class StadeController < ApplicationController
  before_action :admin_require
  layout 'admin'

  def index_admin
    @stades = Stade.order(:name => :asc)
  end

  def new

  end

  def create
    @stade = Stade.new(stade_params)

    if @stade.valid?
      @stade.save
      redirect_to :stade_admin
    else
      render 'new'
    end
  end

  def edit
    @stade = Stade.find_by(:id => params[:id])
  end

  def update
    @stade = Stade.find_by(:id => params[:id])

    if @stade.update(stade_params)
      redirect_to :stade_admin
    else
      render 'edit'
    end
  end

  def destroy
    @stade = Stade.find_by(:id => params[:id])
    @stade.destroy

    redirect_to :stade_admin
  end

  private
  def stade_params
    params.require(:stade).permit(:name)
  end
end
