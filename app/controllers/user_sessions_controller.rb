class UserSessionsController < ApiBaseController
    skip_before_filter :require_valid_token, only: :create
    skip_filter :require_valid_token, only: :destroy

    def create
        if @user = login(login_user[:email], login_user[:password]) || @user = login(login_user[:name], login_user[:password])

            token = @user.activate
            @access_token = token.access_token
            # render :json => @user, nothing: true, status: :ok

            render json: @user, root: false

        else
            # @message = 'check your params!!!'
            # render "api_base/authorization", :formats => [:json], :handlers => [:jbuilder]
            render nothing: true, status: :bad_request
        end

    end

    def destroy
        access_token = request.headers[:HTTP_ACCESS_TOKEN]
        token = Token.find_by_access_token(access_token)
        if token
            @user = User.find(token.user_id)
            logout
            @user.inactivate
            # render "create", :formats => [:json], :handlers => [:jbuilder]
            render :json => @user, nothing: true, status: :ok
        else
            render nothing: true, status: :not_found
        end
    end

    private

        def login_user
            params[:user]
        end
        # private
end         #UserSessionsController