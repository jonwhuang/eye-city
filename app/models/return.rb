class Return < ActiveRecord::Base
  belongs_to :brand
  belongs_to :manufacturer

  validates :auth_number, :return_date, :brand_id, :manufacturer_id, :frame_count, presence: true

  validates :frame_count, numericality: { greater_than_or_equal_to: 1 }

  def credited?
    self.credit_memo_number != "" && self.credit_memo_number
  end

  def days_pending
    (Date.today - self.return_date).to_i
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << ["Manufacturer", "Brand", "Frame Count", "RA Number", "RA Date", "CM Number", "CM Date", "Notes"]
      all.order(:return_date).each do |entry|
        csv << [
          entry.manufacturer.name,
          entry.brand.name,
          entry.frame_count,
          entry.auth_number,
          entry.return_date.try(:strftime, '%m-%d-%Y'),
          entry.credit_memo_number,
          entry.credit_date.try(:strftime, '%m-%d-%Y'),
          entry.comments
        ]
      end
    end
  end

end
