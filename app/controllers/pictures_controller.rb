class PicturesController < ApplicationController
  def index
    @pictures = Event.all
  end

    def destroy
      @picture = Event.find(params[:id])
      @picture.image=nil
      if @picture.save
       redirect_to events_path, notice: "画像を削除しました"
      else
       redirect_to events_path, notice: "画像が削除できませんでした"
      end
    end

    def edit
      @picture = Event.find(params[:id])
    end

    def update
      @picture = Event.find(params[:id])
      @picture.update(pictures_params)
      goindex
    end

    private
      def pictures_params
            params.require(:picture).permit(:image)
      end
end
