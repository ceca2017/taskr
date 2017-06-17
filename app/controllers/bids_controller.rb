class BidsController < ApplicationController
  def create
    @task = Task.find(params[:task_id])
    if Bid.exists?(user: current_user)
      redirect_to task_path(@task)
      flash[:notice] = 'Sorry you can only make one offer. Please update your current offer if you need to change your bid'
    else
      if bid_params[:terms_of_service] == '1' && bid_params[:quote] == true
        @bid = @task.bids.new(bid_params)
        @bid.user = current_user
        @bid.save
        redirect_to task_path(@task)
        flash[:notice] = 'Offer Made!'
      elsif bid_params[:terms_of_service] == '1' && bid_params[:quote] == false
        flash[:notice] = 'Please quote an amount'
        redirect_to task_path(@task)
      elsif bid_params[:terms_of_service] == '0' && bid_params[:quote] == true
        flash[:notice] = 'Please confirm you have read the Terms and Conditions'
        redirect_to task_path(@task)
      end
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:quote, :task_id, :terms_of_service)
  end
end
