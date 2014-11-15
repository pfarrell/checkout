Sequel.migration do
  change do
    create_table(:users) do
      primary_key :id
      String :user_id
      String :name
      DateTime :created_at
      DateTime :updated_at
    end
  end
end
