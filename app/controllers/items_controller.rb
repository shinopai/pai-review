class ItemsController < ApplicationController
  before_action :set_q, only: %i(index search)

  def index
    @items = Item.page(params[:page]).per(5).order(created_at: :desc)
    @total = Item.count
  end

  def show
    @item = Item.find(params[:id])
    @review = Review.new
    @review_scores = Review.where(item_id: @item).pluck(:score)

    if @review_scores.size == 1
      @score_avg = @review_scores.sum.fdiv(@review_scores.length).to_i
    else
      @score_avg = @review_scores.sum.fdiv(@review_scores.length)
    end

    if user_signed_in?
      @user = current_user
      @is_liked = Like.where(user_id: @user).where(item_id: @item).any?
      @is_reviewed_item = Review.where(user_id: @user).where(item_id: @item)
      logger.debug('start')
      logger.debug(@score_avg)
      logger.debug('end')
    end
  end

  def search
    @search_word = params[:q][:title_or_description_cont]
    @items = @q.result
  end


  private
  def set_q
    @q = Item.ransack(params[:q])
  end
end
