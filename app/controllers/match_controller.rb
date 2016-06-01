class MatchController < ApplicationController
  layout 'admin', except: [:index]
  before_action :admin_require, except: [:index]

  def index_admin
    @matches = Match.order(begin_at: :asc).paginate(page: params[:page], per_page: 10)
  end

  def new
    @countries = Country.order(name: :asc)
    @pools = Pool.order(name: :asc)
    @stades = Stade.order(name: :asc)
  end

  def create
    @match = Match.new(match_params)
    @match.local_country = Country.find(params[:match][:local_country_id])
    @match.guess_country = Country.find(params[:match][:guess_country_id])
    @match.stade = Stade.find(params[:match][:stade_id])
    @match.pool = Pool.find_by(params[:match][:pool])

    if @match.local_country.id == @match.guess_country.id
      @countries = Country.order(name: :asc)
      @pools = Pool.order(name: :asc)
      @stades = Stade.order(name: :asc)

      @match.errors.add(:guess_country_id ,'Un pays ne peut pas se rencontrer lui même.')
      @match.errors.add(:local_country_id ,'Un pays ne peut pas se rencontrer lui même.')

      render 'new'
      return
    end

    if @match.valid?
      @match.save
      redirect_to :match_admin
      return
    end

    redirect_to :match_new
  end

  def edit
    @match = Match.find_by(id: params[:id])
    @countries = Country.order(name: :asc)
    @pools = Pool.order(name: :asc)
    @stades = Stade.order(name: :asc)
  end

  def update
    @match = Match.find_by(:id => params[:id])
    @match.local_country = Country.find(params[:match][:local_country_id])
    @match.guess_country = Country.find(params[:match][:guess_country_id])
    @match.stade = Stade.find(params[:match][:stade_id])
    @match.pool = Pool.find_by(params[:match][:pool])

    if @match.local_country.id == @match.guess_country.id
      @countries = Country.order(name: :asc)
      @pools = Pool.order(name: :asc)
      @stades = Stade.order(name: :asc)

      @match.errors.add(:guess_country_id ,'Un pays ne peut pas se rencontrer lui même.')
      @match.errors.add(:local_country_id ,'Un pays ne peut pas se rencontrer lui même.')

      render 'edit'
      return
    end

    if @match.update(match_params)
      @match
      redirect_to :match_admin
    else
      render 'edit'
    end
  end

  def destroy
    @match = Match.find(params[:id])
    @match.destroy

    redirect_to :match_admin
  end

  def index
    @matches = Match.order(begin_at: :asc).paginate(page: params[:page], per_page: 6)
  end

  private
  def match_params
    params.require(:match).permit(:begin_at, :local_country_score, :guess_country_score)
  end
end
