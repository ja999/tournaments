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

  def destroy
    tournament.destroy
    redirect_to tournaments_path
  end

  def subscribe
    tournament.users << current_user
    if tournament.save
      flash[:success] = 'You have subscribed to a tournament.'
    else
      flash[:error] = 'Something may have went sideways...'
    end
    redirect_to tournaments_path
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
