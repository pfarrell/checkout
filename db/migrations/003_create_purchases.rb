Sequel.migration do
  change do
    create_table(:purchases) do
      primary_key :id
      Fixnum :item_id
      Fixnum :bidder_id
      Numeric :price
      DateTime :created_at
      DateTime :updated_at
    end
  end
end
