class Shoe < ActiveRecord::Base
  belongs_to :user

  def total
    shoes.sum(&:amount)
  end
end
