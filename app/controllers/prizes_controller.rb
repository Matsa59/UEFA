class PrizesController < ApplicationController
  layout 'admin', except: [:index]
  before_action :authenticate_user!, :admin_require, except: [:index]

  def index_admin
    @prizes = Prize.order(:name => :asc)
  end

  def create
    @prize = Prize.new(prize_params)

    @prize.save
    redirect_to :prize_admin_index
  end

  def new

  end

  def edit
    @prize = Prize.find(params[:id])
  end

  def update
    @prize = Prize.find(params[:id])

    if @prize.update(prize_params)
      redirect_to :prize_admin_index
    else
      render 'edit'
    end
  end

  def destroy
    @prize = Prize.find(params[:id])
    @prize.destroy

    redirect_to :prize_admin_index
  end

  def index
    @prizes = Prize.order(name: :asc)
  end

  private
  def prize_params
    params.require(:prize).permit(:name, :description, :quantity, :ref, :image)
  end
end
