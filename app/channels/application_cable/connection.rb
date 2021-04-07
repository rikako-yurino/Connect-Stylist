module ApplicationCable
  class Connection < ::ActionCable::Connection::Base
    identified_by :current_user, :current_stylist
    def connect
      if cookies.signed['user_id'] != nil
        self.current_user = find_verified_user
      elsif cookies.signed['stylist_id'] != nil
        self.current_stylist = find_verified_stylist
      end
    end
    private
    def find_verified_user
      if verified_user = User.find_by(id: cookies.signed['user_id'])
        verified_user
      else
        reject_unauthorized_connection
      end
    end
    def find_verified_stylist
      if verified_stylist = Stylist.find_by(id: cookies.signed['stylist_id'])
        verified_stylist
      else
        reject_unauthorized_connection
      end
    end
  end
end