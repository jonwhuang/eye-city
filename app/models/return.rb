class Return < ActiveRecord::Base
  belongs_to :brand
  belongs_to :manufacturer

  def credited?
    self.credit_memo_number
  end
end
