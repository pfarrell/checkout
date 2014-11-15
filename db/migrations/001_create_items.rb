Sequel.migration do
  change do
    create_table(:items) do
      primary_key :id
      String :item_id
      String :name
      DateTime :created_at
      DateTime :updated_at
    end
  end
end
