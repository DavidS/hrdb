class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name

      t.timestamps
    end

    create_join_table :people, :projects, id: false do |t|
      t.index :person_id
      t.index :project_id
    end
  end
end
