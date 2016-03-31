class Return < ActiveRecord::Base
  belongs_to :brand
  belongs_to :manufacturer

  def credited?
    self.credit_memo_number != ""
  end

  def days_outstanding
    (Date.today - self.return_date).to_i
  end
end
