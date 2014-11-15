class Item < Sequel::Model
  one_to_one :purchase

  def purchased?
    !self.purchase.nil?
  end
end
