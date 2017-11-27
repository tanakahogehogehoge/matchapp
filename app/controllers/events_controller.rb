class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :apply]

  def index
    @search = Event.ransack(params[:q])
    @Events = @search.result
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
    @comment = @event.comments.build
    @comments = @event.comments
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
    @event.image.retrieve_from_cache! params[:cache][:image]
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

  def apply
  end

  private
  def events_params
    params.require(:event).permit(:store_address, :image, :image_cache, :store_info, :store_info_sub)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
