class Bidder < Sequel::Model
  one_to_many :purchases
end
