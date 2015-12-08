class MessagesController < ApiBaseController
    before_action :find_message, only: [:show, :edit, :update, :destroy]
    skip_before_filter :require_valid_token, only: :index

    def index
        @messages = Message.all.order("created_at DESC")
        render :json => @messages
    end

    def show
    end

    # def new
        # @message = set_user.messages.build
    # end

    def create
        @message = set_user.messages.build(message_params)
        if @message.save
            render :json => @message
            # redirect_to root_path
        else
            render nothing: true, status: :not_found
            # render 'new'
        end
    end

    def edit
    end

    def update
        if @message.update(message_params)
            render :json => @message
        else
            render nothing: true, status: :not_found
        end
    end

    def destroy
        @message.destroy
        render nothing: true, status: :ok
    end

    private
        def set_user
            access_token = request.headers[:HTTP_ACCESS_TOKEN]
            token = Token.find_by_access_token(access_token)

            if token
                user = User.find(token.user_id)
                return user
            else
                render nothing: true, status: :not_found
            end
        end

        def message_params
            params.require(:message).permit(:title, :content)
        end

        def find_message
            @message = Message.find(params[:id])
        end
end