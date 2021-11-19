module Helper
  module ControllerSpec
    def signin_user
      before(:each) do
        @user = create(:user)
        sign_in @user
      end
    end

    def signin_admin
      before(:each) do
        @user = create(:is_admin)
        sign_in @user
      end
    end
  end
end
