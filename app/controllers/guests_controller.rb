class GuestsController < ApplicationController
    def new_guest
        user = User.find_or_create_by!(email: 'guest@example.com') do |user|
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストログインとしてログインしました。'
    end
end
