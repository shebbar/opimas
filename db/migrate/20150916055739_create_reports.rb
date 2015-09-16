class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :title
      t.text :summary
      t.datetime :publication_date
      t.attachment :press_release
      t.attachment :main_report
      t.attachment :charts
      t.attachment :vid

      t.timestamps null: false
    end
  end
end
