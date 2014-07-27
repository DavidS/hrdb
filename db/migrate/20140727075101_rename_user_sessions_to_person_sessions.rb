class RenameUserSessionsToPersonSessions < ActiveRecord::Migration
  def change
    rename_table :user_sessions, :person_sessions
  end
end
