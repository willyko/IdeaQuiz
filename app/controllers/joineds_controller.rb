class JoinedsController < ApplicationController
  before_action :authenticate_user!

  def create
    @joined = current_user.joineds.new
    idea = Idea.find params[:idea_id]
    @joined.idea = idea
    if @joined.save
      redirect_to idea, notice: "Joined!"
    else
      redirect_to idea, alert: "Can't join!"
    end
  end

  def destroy
    joined = current_user.joineds.find params[:id]
    joined.destroy
    redirect_to joined.idea, notice: "Left~"
  end

end
