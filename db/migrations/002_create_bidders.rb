Sequel.migration do
  change do
    create_table(:bidders) do
      primary_key :id
      String :bidder_id
      String :name
      DateTime :created_at
      DateTime :updated_at
    end
  end
end
