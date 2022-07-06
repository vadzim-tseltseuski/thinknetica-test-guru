class FeedbacksController < ApplicationController

  def show; end

  def create
    result = FeedbacksMailer.feedback(feedback_params[:feedback], current_user).deliver_now
    redirect_to feedback_path, success: 'Feedback sent'
  end

  private

  def feedback_params
    params.permit(:feedback)
  end
end
