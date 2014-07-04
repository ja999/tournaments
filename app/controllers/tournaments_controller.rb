class TournamentsController < ApplicationController
  expose(:tournament, attributes: :tournament_params)
  expose :tournaments

  def index; end

  def new; end

  def create
    tournament.creator = current_user
    if tournament.update_attributes!(tournament_params)
      flash[:success] = 'A tournament has been created'
      redirect_to tournaments_path
    else
      render :new
    end
  end

  def update
    if tournament.update_attributes!(tournament_params)
      redirect_to tournaments_path
    else
      render :edit
    end
  end

  private

  def tournament_params
    params.require(:tournament).permit(
      :name,
      :discipline,
      :max_participants,
      :time_of_event,
      :deadline,
      :user_id
    )
  end
end
