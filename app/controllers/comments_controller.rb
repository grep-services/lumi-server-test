class CommentsController < ApiBaseController
    before_action :find_message, only: [:create, :edit, :update, :destroy]
    before_action :find_comment, only: [:edit, :update, :destroy]

    def create
        @comment = @message.comments.create(comment_params)
        @comment.user_id = set_user.id

        if @comment.save
            render :json => @comment
        else
            render nothing: true, status: :not_found
        end
    end

    def edit
    end

    def update
        if @comment.update(comment_params)
            render :json => @comment
        else
            render nothing: true, status: :not_found
        end
    end

    def destroy
        @comment.destroy
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

        def comment_params
            params.require(:comment).permit(:content)
        end

        def find_message
            @message = Message.find(params[:message_id])
        end

        def find_comment
            @comment = @message.comments.find(params[:id])
        end
end         #CommentsController