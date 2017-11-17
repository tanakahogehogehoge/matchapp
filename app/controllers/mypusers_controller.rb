class MypusersController < ApplicationController
  def index
  end

  def create
    @mypuser = Mypuser.create(mypusers_params)
    @mypuser.user_id = current_user.id
    if @mypuser.save
      redirect_to mypusers_path, notice: "作成しやした！"
    else

    end
  end

  def show
    @mypusers = Mypuser.all
  end

  def new
    @mypuser = Mypuser.new
  end

  private

  def mypusers_params
    params.require(:mypuser).permit(:user_name, :user_address, :user_bank_account)
  end
end
