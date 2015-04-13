class IdeasController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  IDEAS_PER_PAGE = 20

  before_action :find_idea, only: [:show, :edit, :update, :destroy]

  def index
    #@ideas = Idea.page(params[:page]).per(IDEAS_PER_PAGE)
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = current_user.ideas.new(idea_params)

    if @idea.save
      flash[:notice] = "Idea Created Successfully!"
      redirect_to idea_path(@idea)
    else
      render :new
    end
  end

  def show
    #@like = @question.like_for(current_user) if user_signed_in?
    #@favourite = @question.favourite_for(current_user) if user_signed_in?
    #@question.increment_view_count
    #@vote = @question.vote_for(current_user) if user_signed_in?
    # Instantiating an empty answer object to be used
    # with the form that creates an answer on the 
    # the question show page
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @idea.update(idea_params)
      redirect_to @idea, notice: "Idea updated successfully!"
    else
      flash[:alert] = "Please correct errors below"
      render :edit
    end
  end

  def destroy
    @idea.destroy
    redirect_to ideas_path, notice: "Idea deleted successfully!"
  end

  private

  def find_idea
    @idea = Idea.find(params[:id])
  end

  def idea_params
    params.require(:idea).permit(:title, :body)
  end

end
