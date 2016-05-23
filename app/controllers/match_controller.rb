class MatchController < ApplicationController
  layout 'admin', except: [:index]
  before_action :admin_require, except: [:index]

  def index_admin
    @matches = Match.order(begin_at: :asc).paginate(page: params[:page], per_page: 10);
  end

  def new
    @countries = Country.order(name: :asc)
  end

  def create
    @match = Match.new(match_params)
    @match.local_country = Country.find(params[:match][:local_country_id])
    @match.guess_country = Country.find(params[:match][:guess_country_id])

    if @match.local_country.id == @match.guess_country.id
      redirect_to :match_new
    end

    if @match.valid?
      @match.save
      redirect_to :matches_admin_index
      return
    end

    redirect_to :match_new
  end

  def edit

  end

  def update

  end

  def destroy
    @match = Match.find(params[:id])
    @match.destroy

    redirect_to :matches_admin_index
  end

  def index

  end

  private
  def match_params
    params.require(:match).permit(:begin_at)
  end
end
