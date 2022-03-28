class AdminsController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.role == "member"
      authorize! :read, :Admin
    end
  end
end

