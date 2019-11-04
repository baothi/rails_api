class Api::V1::RegistrationsController < Devise::RegistrationsController
    before_action :ensure_params_exist, only: :create
    # sign up
    def create
      user = User.new user_params
      if user.save
        # render json:{
        #     messages: "Signed Up Successfully",
        #     is_success: true,
        #     data: {
        #         user: user
        #     }
        # }, status: :ok
        json_response "Signed up successfully", true, {user: user}, :ok
      else
      	json_response "something wrong", false, {}, :unprocessable_entity
        # render json:{
        #     messages: "something wrong",
        #     is_success: false,
        #     data: {}
        # }, status: :unprocessable_entity
      end
    end

    private
      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end

      def ensure_params_exist
        return if params[:user].present?
      	json_response "Missing params", false, {}, :bad_request
        # render json: {
        #     messages: "Missing params",
        #     is_success: false,
        #     data: {}
        # }, status: :bad_request
      end

end

	# rails status
	# https://gist.github.com/mlanett/a31c340b132ddefa9cca