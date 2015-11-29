class ItemsController < ApplicationController

  def index
    @items=Item.all
  end

  def create
    @item=Item.new
    @item.name = params[:item][:name]
    @item.user_id=current_user.id

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

  def destroy
    @item=Item.find(params[:id])

    if @item.destroy
      flash[:notice] = "Item was deleted."
      #redirect_to action: :index
    else
      flash[:error] = "Item couldn't be deleted. Try again."
      #redirect_to action: :index
    end
    respond_to do |format|
         format.html
         format.js 
    end
  end



end
