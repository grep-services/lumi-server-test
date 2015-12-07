class ApiBaseController < ApplicationController
    before_action :require_valid_token

    private

        def require_valid_token
            access_token = request.headers[:HTTP_ACCESS_TOKEN]
            if !User.login?(access_token)
                # @error = 'Authorizated!! login please'
                # render "authorization", :formats => [:json], :handlers => [:jbuilder]
                render nothing: true, status: :unauthorized
            end
        end

end         #ApiBaseController