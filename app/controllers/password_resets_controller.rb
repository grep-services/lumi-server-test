class PasswordResetsController < ApiBaseController
    before_action :find_email, only: :create
    before_filter :set_user
    skip_before_filter :require_valid_token
    
    def create
        if @user
            @user.deliver_reset_password_instructions!
            render nothing: true, status: :ok
        else
            render nothing: true, status: :not_found
        end
    end

    def edit
        if set_token_user_from_params?
            render "password_resets/resets", :formats => [:html]
        else
            render nothing: true, status: :not_found
        end
    end

    def update
        if @user.name = params[:id]
            @user.password_confirmation = params[:user][:password_confirmation]

            if @user.change_password!(params[:user][:password])
                render nothing: true, status: :ok
            else
                render nothing: true, status: :not_found
            end
        else
            @error = 'Invalided url params'
            render "result/error", :formats => [:json], :handlers => [:jbuilder]
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

        def find_email
            @user = User.find_by_email(params[:email])
        end

    #private
end         #PasswordResetsController