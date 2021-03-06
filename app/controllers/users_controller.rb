class UsersController < ApplicationController
before_action :authenticate_user!, only: [:show]

def index
  @users = User.all
end

def show
  @user = current_user
  @sorted_prompts = current_user.prompts.order(created_at: :desc)
end

end
