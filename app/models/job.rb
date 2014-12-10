class Job < ActiveRecord::Base
  belongs_to :customer
  belongs_to :contractor

  has_many :item_details

  def cost
    cost = 0.00
    self.item_details.each do |i_d|
      if !i_d.item.nil? && !i_d.item.price.nil?
        cost += (i_d.item.price * i_d.quantity)  
      end
    end

    if !self.price.nil?
      cost += self.price
    end

    cost
  end

  def tax
    self.cost * 0.06
  end

  def post_tax_cost
    self.cost + self.tax
  end

  def cents
    (self.post_tax_cost * 100).to_i
  end
end
