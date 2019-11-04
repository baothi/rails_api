class Api::V1::RegistrationsController < Devise::RegistrationsController
    before_action :ensure_params_exist, only: :create
    # sign up
    def create
      user = User.new user_params
      if user.save
        render json:{
            messages: "Signed Up Successfully",
            is_success: true,
            data: {
                user: user
            }
        }, status: :ok
      else
        render json:{
            messages: "something wrong",
            is_success: false,
            data: {}
        }, status: unprocessable_entity
      end
    end

    private
      def user_params
        params.require(:user).permit(:email, :password, :password_confimation)
      end

      def ensure_params_exist
        return if params[:user].present?
        return json: {
            messages: "Missing params",
            is_success: false,
            data: {}
        }
      end

end

	# rails status
	# https://gist.github.com/mlanett/a31c340b132ddefa9cca