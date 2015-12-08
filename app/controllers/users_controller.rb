class UsersController < ApiBaseController
    skip_before_filter :require_valid_token, only: [:create, :activate]
    before_filter :set_user, only: [:destroy, :show, :update]

    def index
        # @users = User.all
        # render :json => @users
    end

    def show
        if !@user.name == params[:id]
            render :json => @user, status: :ok
        else
            @error = 'wrong name params'
            render "result/error", :formats => [:json], :handlers => [:jbuilder]
        end
    end

    def  create
        if @user = User.new(user_params)
            @user.save
            render :json => @user, status: :created
        else
            @error = 'wrong user params'
            render "result/error", :formats => [:json], :handlers => [:jbuilder]
            # render :json => @user.errors, status: :bad_request
        end
    end

    def update
        if @user.update
            render json: @user
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def destroy
        if @user.name == params[:id]
            @user.destroy
            render :json => @user, status: :ok
        else
            @error = 'wrong name params'
            render "result/error", :formats => [:json], :handlers => [:jbuilder]
        end
    end

    def activate
        if (@user = User.load_from_activation_token(params[:id]))
            @user.activate!
            render "users/activate", :formats => [:html]
        else
            render nothing: true, status: :not_found
        end
    end

    private

        def user_params
            params.require(:user).permit(:email, :name, :password, :password_confirmation)
        end
    # => private
end         #UserController