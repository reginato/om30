class AddPhotoToMunicipe < ActiveRecord::Migration[6.1]
  def change
    add_column :municipes, :photo, :string
  end
end
