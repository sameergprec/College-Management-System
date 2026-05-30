class AddCodeToDepartments < ActiveRecord::Migration[8.0]
  def change
    add_column :departments, :code, :string
  end
end
