Sequel.migration do
  change do
    create_table(:items) do
      primary_key :id
      String :item_number
      String :title
      DateTime :created_at
      DateTime :updated_at
    end
  end
end
