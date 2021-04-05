module ApplicationCable
  class Connection < ::ActionCable::Connection::Base
    @user_cookie = cookies.signed['user_id'] if cookies.signed['user_id'] != nill
    @stylist_cookie = cookies.signed['stylist_id'] if cookies.signed['stylist_id'] != nill
    if  @user_cookie.present?
      identified_by :current_user
    elsif @stylist_cookie.present?
      identified_by :current_stylist
    end

    def connect
      self.current_user = find_verified_user
      self.current_stylist = find_verified_stylist
    end

    private
    if cookies.signed['user_id'] != nil
      def find_verified_user
        if verified_user = User.find_by(id: cookies.signed['user_id'])
          binding.pry
          verified_user
        else
          reject_unauthorized_connection
        end
      end
    elsif cookies.signed['stylist_id'] != nil
      def find_verified_stylist
        if verified_stylist = Stylist.find_by(id: cookies.signed['stylist_id'])
          verified_stylist
        else
          reject_unauthorized_connection
        end
      end
    end
  end
end