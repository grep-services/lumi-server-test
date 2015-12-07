class BmisController < ApiBaseController
    before_filter :set_user, only: [:index, :create, :destroy]

    def index
        @bmis = @user.bmi
        if @bmis.count > 0
            render :json => @bmis
            # , root: false
        else
            @message = 'Not exist bmi data'
            render "result/message", :formats => [:json], :handlers => [:jbuilder]
        end
    end         #index

    def create
        @bmi = @user.bmi.create(bmi_params)
        @bmi.datetime = DateTime.now
        @bmi.save
        render :json => @bmi
    end         #create

    def destroy
        if @user.name == params[:id]
            @bmis = @user.bmi
            if @bmis
                @bmis.destroy_all
                @message = 'Deleted all bmis data'
                render "result/message", :formats => [:json], :handlers => [:jbuilder]
            else
                render noting: true, status: :bad_request
            end
        else
            @error = 'wrong name params'
            render "result/error", :formats => [:json], :handlers => [:jbuilder]
        end
    end     #destroy

    private

        def bmi_params
            params.require(:bmis).permit(:value)
        end

end         #BmisController