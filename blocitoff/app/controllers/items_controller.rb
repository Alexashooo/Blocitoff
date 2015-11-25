class ItemsController < ApplicationController

  def index
    @items=Item.all
  end

  def create
    @item=Item.new
    @item.name = params[:item][:name]
    @item.user = @user

    if @item.save
      flash[:notice] = "Your item is saved!"
      redirect_to user_items_path, notice: "Topic was saved successfully"

    else
     flash[:error] = "There was an error creating ne item. Please try again."
     render :new
   end

  end

  def new
    @user=current_user
    @item=Item.new
  end

end
