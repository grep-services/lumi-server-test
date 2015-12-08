class DevicesController < ApiBaseController
    before_filter :set_user, only: [:index, :create, :destroy]

    def index
        @devices = @user.device
        if @devices.count > 0
            render :json => @devices
        else
            @message = 'Not exist Device data'
            render "result/message", :formats => [:json], :handlers => [:jbuilder]
        end
    end

    def create
        @device = @user.device.create(device_params)
        @device.save
        render :json => @device
    end

    def destroy
        if @user.name == params[:id]
            @devices = @user.device
            if @devices
                @devices.destroy_all
                @message = 'Deleted all Device data'
                render "result/message", :formats => [:json], :handlers => [:jbuilder]
            else
                render noting: true, status: :bad_request
            end
        else
            @error = 'Invalided url params'
            render "result/error", :formats => [:json], :handlers => [:jbuilder]
        end
    end

    private

        def device_params
            params.require(:device).permit(:timestamp_on, :timestamp_off)
        end

end         #DivisesController