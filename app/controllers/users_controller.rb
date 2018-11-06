class UsersController < ApplicationController
before_action :authenticate_user!, only: [:show]

def index
  @users = User.all
end

def show
  @user = current_user
  @prompts = @user.prompts
end

end
