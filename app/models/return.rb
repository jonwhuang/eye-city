class Return < ActiveRecord::Base
  belongs_to :brand
  belongs_to :manufacturer

  validates :auth_number, :return_date, :brand_id, :manufacturer_id, :frame_count, presence: true

  validates :frame_count, numericality: { greater_than_or_equal_to: 1 }

  def credited?
    self.credit_memo_number != ""
  end

  def days_outstanding
    (Date.today - self.return_date).to_i
  end
end
