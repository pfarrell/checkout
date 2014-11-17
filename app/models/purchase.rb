class Purchase < Sequel::Model
  many_to_one :bidder
  many_to_one :item

  def purchase_price
    '%0.2f' % self.price
  end
end
