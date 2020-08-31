class ItemsController < ApplicationController
  before_action :move_to_session, only: :new
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
    @purchases = Purchase.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @purchases = Purchase.all
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end 

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :condition_id, :shipping_charge_id, :seller_prefecture_id, :days_until_shipping_id, :price).merge(user_id: current_user.id)
  end

  def move_to_session
    unless user_signed_in?
      redirect_to controller: 'users/sessions', action: :new
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
