class AddPublishDateToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :publish_at, :datetime
  end
end
