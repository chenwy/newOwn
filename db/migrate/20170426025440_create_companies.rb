class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :scale
      t.string :address
      t.string :nature
      t.string :webSite
      t.string :industry
      t.timestamps
    end
  end
end
