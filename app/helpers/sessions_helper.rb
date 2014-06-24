# helper functions used by both controller and view.
# helpers are available in views by default.
# need to explicity include helpers in application controller.
module SessionsHelper
    def signed_in?
        !current_user.nil?
    end

    def sign_in(user)
        cookies.permanent[:remember_token] = user.remember_token
        self.current_user = user
    end

    def sign_out
        cookies.delete(:remember_token)
        self.current_user = nil
    end

    def current_user=(user)
        @current_user = user
    end

    def current_user
        @current_user ||= User.find_by_remember_token(cookies[:remember_token])
    end
end
