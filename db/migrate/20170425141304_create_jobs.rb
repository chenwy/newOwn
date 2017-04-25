class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string   :title
      t.text     :description
      t.integer  :wage_lower_bound
      t.integer  :wage_upper_bound
      t.string   :contact_email
      t.boolean  :is_hidden
      t.datetime :created_at,                  null: false
      t.datetime :updated_at,                   null: false
      t.integer  :user_id
      t.string   :company
      t.string   :workplace
      t.integer  :require_num,      default: 0
      t.string   :job_class
      t.string   :phone
      t.string   :duty
      t.timestamps
    end
  end
end
