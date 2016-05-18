class HomeController < ApplicationController
  def index
    @matches = Match.order(:begin_at => :asc).where('begin_at >= :date', date: (DateTime.now + 1.day).in_time_zone.to_s).limit(3)
  end
end
