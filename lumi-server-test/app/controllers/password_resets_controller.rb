class PasswordResetsController < ApiBaseController
    skip_before_filter :require_valid_token
    
    def create
        @user = User.find_by_email(params[:email])
        @user.deliver_reset_password_instructions!

        if @user
            render nothing: true, status: :create
        else
            render nothing: true, status: :not_found
        end
    end

    def edit
        if set_token_user_from_params?
            render nothing: true, status: :ok
        else
            render nothing: true, status: :not_found
        end
    end

    def update
        return if !set_token_user_from_params?
        @user.password_confirmation = params[:user][:password_confirmation]

        if @user.change_password!(params[:user][:password])
            render nothing: true, status: :ok
        else
            render nothing: true, status: :not_found
        end
    end

    private

        def set_token_user_from_params?
            @token = params[:id]
            @user = User.load_from_reset_password_token(params[:id])
            if @user.blank?
                not_authenticated
                return false
            else
                return true
            end
        end
    #private
end         #PasswordResetsController