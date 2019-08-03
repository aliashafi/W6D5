# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint           not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
    validates :cat_id, :start_date, :end_date, :status, presence: true
    validates :status, inclusion: {in: %w(PENDING APPROVED DENIED)}

    def overlapping_requests
        CatRentalRequest.where("cat_id = ?", self.cat_id) 
        .where("start_date <= ? AND ? <= end_date", self.end_date, self.start_date)
    end

    def overlapping_approved_requests
        overlapping_requests.where("status = 'APPROVED'")
    end

    def does_not_overlap_approved_request
        !overlapping_approved_requests.exists?
    end

    belongs_to :cat
end
