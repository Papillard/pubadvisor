class ReviewsController < ApplicationController

  before_action :set_pub

  def create
    @review = Review.new(review_params)
    @review.pub = @pub
    if @review.save
      redirect_to pub_path(@pub)
    else
      render "pubs/show"
    end
  end

  private
  def set_pub
    @pub = Pub.find(params[:pub_id])
  end
  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
