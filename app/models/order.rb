class Order < ApplicationRecord
	has_many :order_items, :dependent => :destroy
  accepts_nested_attributes_for :order_items, reject_if: :all_blank, allow_destroy: true

  def cost_total
  	self.order_items.pluck(:cost).sum()
  end

  def sale_tax_total
  	self.order_items.pluck(:sale_tax).sum()
  end
end
