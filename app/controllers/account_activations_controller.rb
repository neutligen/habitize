class AccountActivationsController < ApplicationController

	def edit
		user = User.find_by(email: params[:email])
		if user && !user.activated? && user.authenticated?(activation, params[:id])
			user.update_attribute(:activated, true)
			user.update_attribute(:activated_at, Time.zone.now)
			log_in user
			flash[:info] = "ありがとうございます！　アカウントが有効化されました。"
			redirect_to user
		else
			flash[:danger] = "メールの期限切れ、もしくは、無効な操作です。"
			redirect_to root_url
		end
	end
end
