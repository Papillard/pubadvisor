class PubsController < ApplicationController
  def index
    @pubs = Pub.all
  end

  def show
    @pub = Pub.find(params[:id])
    @review = Review.new
  end
end
