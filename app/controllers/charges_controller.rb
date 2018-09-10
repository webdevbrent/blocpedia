class ChargesController < ApplicationController
    before_action :authenticate_user!
  def create
    # Creates a Stripe Customer Object, for associating with the charge
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    # Where the magic happens
    charge = Stripe::Charge.create(
      customer: customer.id, # This is NOT user_id
      amount: Amount.premium,
      description: "BigMoney Membership = #{current_user.email}",
      currency: 'usd'
    )


    flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
    current_user.premium!
    redirect_to edit_user_registration_path

    # Stripe will send back CardErrors when something goes wrong
  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_charge_path
  end

  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "BigMoney Membership - #{current_user.email}",
      amount: Amount.premium
    }
  end
end
