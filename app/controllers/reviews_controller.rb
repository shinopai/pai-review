class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user
  before_action :find_item

  def create
    @review = Review.new
    @review.user_id = @user.id
    @review.item_id = @item.id
    @review.score = review_params[:score]
    @review.body = review_params[:body]

    if @review.save
    redirect_to request.referer, notice: @item.title + 'へのレビューを投稿しました'
  else
    @review = Review.new
    if user_signed_in?
      @user = current_user
      @isLiked = Like.where(user_id: @user).where(item_id: @item).any?
    end
    render template: 'items/show'
  end
  end

  def delete_review
    @review = Review.where(user_id: @user).find_by(item_id: @item)
    @review.destroy

    redirect_to request.referer, notice: @item.title + 'に対するレビューを削除しました'
  end

  private
  def review_params
    params.require(:review).permit(:score, :body)
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_item
    @item = Item.find(params[:item_id])
  end
end
