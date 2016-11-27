class UsersController < ApplicationController
  before_action :signed_in?

  def index
  end

  def new
  end

  def create
  end

  def show
    @user = User.find_by(id: params['id'])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def signed_in?
      unless user_signed_in?
        redirect_to "/users/sign_in" unless request.fullpath == '/users/sign_in'
      end
    end
end
