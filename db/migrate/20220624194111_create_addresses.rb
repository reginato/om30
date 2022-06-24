class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :cep
      t.string :street
      t.string :complement
      t.string :city
      t.string :uf
      t.string :ibge_code
      t.string :neighborhood

      t.timestamps
    end
  end
end
