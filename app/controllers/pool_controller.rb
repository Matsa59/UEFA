class PoolController < ApplicationController
  layout 'admin', except: [:index]
  before_action :admin_require, except: [:index]

  def index_admin
    @pools = Pool.order(name: :asc)
  end

  def index

  end

  def new

  end

  def edit
    @pool = Pool.find_by(id: params[:id])
  end

  def create
    @pool = Pool.new(pool_params)

    if @pool.valid?
      @pool.save

      redirect_to :pools_admin
      return
    end

    render 'new'
  end

  def update
    @pool = Pool.find_by(id: params[:id])

    if @pool.update(pool_params)
      redirect_to :pools_admin
    else
      render 'edit'
    end
  end

  def destroy
    @pool = Pool.find(params[:id])
    @pool.destroy

    redirect_to :pools_admin
  end

  private
  def pool_params
    params.require(:pool).permit(:name)
  end
end
