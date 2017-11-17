class MypownersController < ApplicationController
  def index
  end

  def create
    @mypowner = Mypowner.create(mypowners_params)
    @mypowner.owner_id = current_owner.id
    if @mypowner.save
      redirect_to mypowners_path, notice: "作成しやした！"
    else

    end
  end

  def show
    @mypowners = Mypowner.all
  end

  def new
    @mypowner = Mypowner.new
  end

  private

  def mypowners_params
    params.require(:mypowner).permit(:owner_name, :owner_address, :owner_bank_account)
  end
end
