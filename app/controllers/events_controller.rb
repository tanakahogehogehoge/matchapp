class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def new
    if params[:back]
      @event = Event.new(events_params)
    else
      @event = Event.new
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  def update
    @event.update(events_params)
    redirect_to events_path
  end

  def create
    @event = Event.new(events_params)
    @event.owner_id = current_owner.id
    if @event.save
      NoticeMailer.sendmail_event(@event).deliver
      redirect_to events_path, notice: "店舗またはスペース情報が登録されました！"
    else
      render 'new'
    end
  end

  def confirm
    @event = Event.new(events_params)
    render 'new' if @event.invalid?
  end

  private
  def events_params
    params.require(:event).permit(:store_address, :store_picture, :store_info, :store_info_sub)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
