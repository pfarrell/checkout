class Purchase < Sequel::Model
  many_to_one :user
  many_to_one :item
end
