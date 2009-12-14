ActiveRecord::Schema.define(:version => 0) do
  
  create_table :mocks, :force => true do |t|
    t.column :mock_string, :string
    t.column :mock_text, :text
  end

end