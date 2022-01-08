class HomeController < ApplicationController
  before_action :set_q, only: %i(search_form)

  def search_form
    render 'search-form'
  end

  def index
    @items = Item.all.order(created_at: :desc)
  end

  private
  def set_q
    @q = Item.ransack(params[:q])
  end
end
