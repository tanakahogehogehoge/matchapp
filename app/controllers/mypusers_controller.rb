class MypusersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_mypuser, only: [:edit, :update]

  def index
    @mypusers = Mypuser.all
    if @mypusers.present?

    else
      redirect_to new_mypuser_path
    end
  end

  def create
    @mypuser = Mypuser.create(mypusers_params)
    @mypuser.user_id = current_user.id
    if @mypuser.save
      redirect_to mypusers_path, notice: "作成しやした！"
    else
      render 'new'
    end
  end

  def show
    @mypusers = Mypuser.all
  end

  def new
    @mypusers = Mypuser.all
    if @mypusers.present?
      redirect_to mypusers_path
    else
      if params[:back]
        @mypuser = Mypuser.new(mypusers_params)
      else
        @mypuser = Mypuser.new
      end
    end
  end

  def edit
  end

  def update
    @mypuser.update(mypusers_params)
    redirect_to mypuser_path
  end

  def confirm
    @mypuser = Mypuser.new(mypusers_params)
    render :new if @mypuser.invalid?
  end

  private

  def mypusers_params
    params.require(:mypuser).permit(:user_name, :user_address, :user_bank_account)
  end

  def set_mypuser
    @mypuser = Mypuser.find(params[:id])
  end
end
