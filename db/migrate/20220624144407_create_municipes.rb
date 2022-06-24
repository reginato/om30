class CreateMunicipes < ActiveRecord::Migration[6.1]
  def change
    create_table :municipes do |t|
      t.string :name
      t.string :cpf
      t.string :cns
      t.string :email
      t.date :birth_date
      t.string :phone
      t.string :status

      t.timestamps
    end
  end
end
