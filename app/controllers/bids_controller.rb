class BidsController < ApplicationController
  def create
    @task = Task.find(params[:task_id])
    if Bid.where(user: current_user).where(task: @task).exists?
      redirect_to task_path(@task)
      flash[:notice] = 'Sorry you can only make one offer. Please update your current offer if you need to change your bid'
    elsif bid_params[:quote] == ''
      flash[:notice] = 'Please quote an amount'
      redirect_to task_path(@task)
    elsif bid_params[:terms_of_service] == '0'
      flash[:notice] = 'Please confirm you have read the Terms and Conditions'
      redirect_to task_path(@task)
    else
      binding.pry
      @bid = @task.bids.new(bid_params)
      @bid.user = current_user
      @task.status = 'Bidding'
      @bid.save
      @task.save
      redirect_to task_path(@task)
      flash[:notice] = 'Offer Made!'
    end
  end

  def show
    # render 'bid_terms_doc.html.haml', layout: 'terms.html.haml'
    @task = Task.find(params[:task_id])
    # redirect_to task_path(@task, confirm: true)
    @bid = Bid.find(params[:id])
  end

  def bid_terms_doc
    render layout: 'terms.html.haml'
  end

  def winning_bid
    binding.pry
    @task = Task.find(params[:task_id])
    @bid = Bid.find(params[:bid_id])
    if params[:tos_accept_bid] == nil
      flash[:notice] = 'Please confirm you have read the Terms and Conditions'
      redirect_to task_bid_path(@task, @bid)
  # if not bid_params[:terms_of_service]
  #   flash[:notice] = 'Please confirm you have read the Terms and Conditions'
  #   redirect_to task_path(@task)
     # redirect_to task_bid_path()
    else
      @task.status = 'Contracted'
      @task.save
      @bid.winning_bid = 1
      #bid.winning_bid_time = DateTime.now
      @bid.save
      flash[:notice] = 'You now have an agreement for this task. Congratulations!'
      redirect_to task_bid_path(@task, @bid)
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:quote, :task_id, :terms_of_service)
  end
end
