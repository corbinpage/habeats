class ChargesController < ApplicationController
  skip_before_filter :only_proofreaders!, only: [:new, :buy_credits]

  # def new
  # end

  # def buy_credits
  #   # Amounts in cents
  #   case params["credits"]
  #   when "1"
  #     amount = 1500
  #     credits_bought = 1
  #   when "2"
  #     amount = 2500
  #     credits_bought = 2
  #   when "3"
  #     amount = 5000
  #     credits_bought = 3
  #   end

  #   customer = Stripe::Customer.create(
  #     :email => current_user.email,
  #     :card  => params[:stripeToken]
  #   )

  #   charge = Stripe::Charge.create(
  #     :customer    => customer.id,
  #     :amount      => amount,
  #     :description => 'Proof Reading Credit Purchased',
  #     :currency    => 'usd'
  #   )

  #   if charge["paid"] == true
  #     current_user.credits += credits_bought
  #     current_user.save
  #     redirect_to user_path(current_user), :notice => "Thank you for your purchase of #{credits_bought} credits"
  #   else
  #     redirect_to new_charge_path, :alert => "Your credit card was not processed correctly"
  #   end
  # rescue Stripe::CardError => e
  #   flash[:error] = e.message
  #   redirect_to new_charge_path
  # end

end
