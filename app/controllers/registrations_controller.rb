class RegistrationsController < ApplicationController
  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    redirect_to signup_success_path
    if @account.save
      redirect_to signup_success_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def account_params
    params.require(:account).permit(
      :account_type, :name, :company_number, :date_of_birth, :email, :password
    )
  end
end
