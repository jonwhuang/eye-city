class AdminMailer < ApplicationMailer
  def monthly_update
    @admin = Admin.first
    @email = @admin.email
    @pending = Return.where("credit_memo_number = '' OR credit_memo_number IS NULL").order(:return_date)
    mail(from: @email,
      to: @email,
      subject: 'testing')
  end
end
