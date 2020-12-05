class Helpers < ApplicationController
    def self.current_user(args)
        user = User.all.find(args[:user_id])
        user
    end

    def self.is_logged_in?(args)
        if args[:user_id]
            true
        else false
        end
    end
end