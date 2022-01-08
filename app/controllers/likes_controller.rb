class LikesController < ApplicationController
  before_action :find_user, only: %i(create unlike)
  before_action :find_item, only: %i(create unlike)

  def create
    @user.items << @item

    redirect_to request.referer, notice: @item.title + 'をお気に入りに登録しました'
  end

  def unlike
    @like = Like.where(user_id: @user).find_by(item_id: @item)
    @like.destroy

    redirect_to request.referer, notice: @item.title + 'のお気に入りを解除しました'
  end

  def show
    @user = User.find(params[:id])

    @item_ids = Like.where(user_id: @user).pluck(:item_id)
    @liked_items = Item.where(id: @item_ids)
  end


  private
  def find_user
    @user = User.find(params[:user_id])
  end

  def find_item
    @item = Item.find(params[:item_id])
  end
end
