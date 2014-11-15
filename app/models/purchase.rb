class Purchase < Sequel::Model
  many_to_one :bidder
  many_to_one :item
end
