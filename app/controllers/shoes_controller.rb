class ShoesController < ApplicationController
  def index
    @shoes = Shoe.all
    @user = User.find(session[:user_id])
    @shoe = Shoe.where('user_id =?', params[:id])

  end

  def show

  end

  def create
    @shoe = Shoe.new(shoe_params)
    if @shoe.save
      redirect_to '/shoes'
    else
      flash[:errors] = 'Could not add'
    end
  end

  def destroy
    shoe = Shoe.find(params[:id])
    puts shoe
    puts
    shoe.destroy
    redirect_to current_user
  end

  private
  def shoe_params
    params.require(:shoe).permit(:product, :seller, :amount).merge(user: current_user)
  end
end
