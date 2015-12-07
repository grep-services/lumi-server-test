class ApiBaseController < ApplicationController
    before_action :require_valid_token

    private

        def require_valid_token
            access_token = request.headers[:HTTP_ACCESS_TOKEN]
            if !User.login?(access_token)
                @token = Token.find_by_access_token(access_token)
                # render :json => @token
                @error = 'Authorizated!! login please'
                render "result/error", :formats => [:json], :handlers => [:jbuilder]

                # render nothing: true, status: :unauthorized
            end
        end

        def set_user
            access_token = request.headers[:HTTP_ACCESS_TOKEN]
            token = Token.find_by_access_token(access_token)

            if token
                @user = User.find(token.user_id)
                return @user
            else
                render nothing: true, status: :not_found
            end
        end         #set_user

end         #ApiBaseController