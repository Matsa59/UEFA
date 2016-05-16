class AdminController < ApplicationController
  before_action :admin_require

  def index
  end

  def users_index
    @users = User.order(:last_name => :asc).paginate(:page => params[:page]);
  end

  def users_download
    @users = User.order(:last_name => :asc);

    respond_to do |format|
      format.xlsx{render xlsx: 'download_user', filename: 'users.xlsx'}
    end
  end
end
