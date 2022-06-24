class AddMunicipeIdToAddress < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :municipe_id, :integer
  end
end
