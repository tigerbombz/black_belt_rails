class UsersController < ApplicationController

  def index
    @user = User.new


  end

  def show
    @user = User.find(params[:id])
    @shoe = Shoe.new
    @shoes = Shoe.where('user_id =?', params[:id])
    @shoes_bought = Shoe.where("user_id =? AND shoe_id =?", session[:user_id], params['id'])
    @shoes_all = Shoe.all
    # @shoe_total = Shoe.find(params[:id][:amount])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to '/'
    end

  end

  def destroy
    reset_session
    redirect_to '/'
  end


  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation).merge(product: Product.find(params[:user_id].to_i))
  end
end
