class CatRentalRequest < ApplicationRecord 
    validates :cat_id, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :status, inclusion: {in: ['APPROVED', 'DENIED', 'PENDING']}
    validate :does_not_overlap_approved_request
    belongs_to :cat,
    foreign_key: :cat_id,
    class_name: :Cat


    def overlapping_requests
       CatRentalRequest.where(cat_id: cat_id, start_date: (start_date..end_date)).where.not(id: id)
                        .or(CatRentalRequest.where(cat_id: cat_id, end_date: (start_date..end_date)).where.not(id: id))
    end

    def overlapping_approved_requests
        overlapping_requests.where(status: 'APPROVED')
    end

    def does_not_overlap_approved_request
        if overlapping_approved_requests.exists?
            errors[:overlapping] << 'approved request exists'
        end 
    end


end
