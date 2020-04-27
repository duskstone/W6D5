require "action_view"
require "action_view/helpers"

COLORS = ['White', 'Black', 'Ginger', 'Cream', 'Cinnamon']

class Cat < ApplicationRecord

    include ActionView::Helpers

    validates :birth_date, presence: true
    validates :color, presence: true, inclusion: {in: COLORS,
        message: "%{value} is not a valid color" }
    validates :name, presence: true
    validates :sex, presence: true, inclusion: {in: ['M', 'F'],
        message: "invalid" }
    validates :description, presence: true

    def age
        time_ago_in_words(birth_date)
    end

    has_many :rental_requests,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest,
    dependent: :destroy


end