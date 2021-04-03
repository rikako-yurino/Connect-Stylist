module ApplicationCable
  class Connection < ::ActionCable::Connection::Base
    identified_by :current_user
    def connect
      self.current_user = find_verified_user
    end
    private
    def find_verified_user
      if cookies.signed['user_id'].present?
        if verified_user = User.find_by(id: cookies.signed['user_id'])
          verified_user
        else
          reject_unauthorized_connection
        end
      elsif cookies.signed['stylist_id'].present?
        if verified_user = Stylist.find_by(id: cookies.signed['stylist_id'])
          verified_user
        else
          reject_unauthorized_connection
        end
      end
    end
  end
end