class AddUserToComments < ActiveRecord::Migration[6.0]
  def up
    add_reference :comments, :user, null: true, foreign_key: true
    # You can set a default user here if you want
    # User.first might not be the best choice, it's just an example
    default_user = User.first
    Comment.update_all(user_id: default_user.id)
    change_column_null :comments, :user_id, false
  end

  def down
    remove_reference :comments, :user
  end
end