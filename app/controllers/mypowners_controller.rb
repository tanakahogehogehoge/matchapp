class MypownersController < ApplicationController
  before_action :authenticate_owner!
  before_action :set_mypowner, only: [:edit, :update]

  def index
    @mypowner = Mypowner.find_by(owner_id:current_owner.id)
    if @mypowner.present?

    else
      redirect_to new_mypowner_path
    end
  end

  def create
    @mypowner = Mypowner.create(mypowners_params)
    @mypowner.owner_id = current_owner.id
    if @mypowner.save
      redirect_to mypowners_path, notice: "作成しやした！"
    else
      render 'new'
    end
  end

  def show
    @mypowner = Mypowner.find_by(owner_id:current_owner.id)
  end

  def new
    @mypowner = Mypowner.find_by(owner_id:current_owner.id)
    if @mypowner.present?
      redirect_to mypowners_path, notice:"すでにプロフィールを作成済みです！"
    else
      if params[:back]
        @mypowner = Mypowner.new(mypowners_params)
      else
        @mypowner = Mypowner.new
      end
    end
  end

  def edit
  end

  def update
    @mypowner.update(mypowners_params)
    redirect_to mypowner_path
  end

  def confirm
    @mypowner = Mypowner.new(mypowners_params)
    render :new if @mypowner.invalid?
  end

  private

  def mypowners_params
    params.require(:mypowner).permit(:owner_name, :owner_address, :owner_bank_account)
  end

  def set_mypowner
    @mypowner = Mypowner.find(params[:id])
  end
end
