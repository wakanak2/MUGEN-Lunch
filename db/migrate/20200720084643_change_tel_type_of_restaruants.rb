class ChangeTelTypeOfRestaruants < ActiveRecord::Migration[5.2]
  def change
  	change_column :restaurants, :tel, :string
  end
end
