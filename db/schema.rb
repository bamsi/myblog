ActiveRecord::Schema[7.0].define(version: 20_220_916_083_601) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'comments', force: :cascade do |t|
    t.text 'text'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'author_id', null: false
    t.bigint 'post_id', null: false
    t.index ['author_id'], name: 'index_comments_on_user_id'
    t.index ['post_id'], name: 'index_comments_on_post_id'
  end

  create_table 'likes', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'author_id', null: false
    t.bigint 'post_id', null: false
    t.index ['author_id'], name: 'index_likes_on_user_id'
    t.index ['post_id'], name: 'index_likes_on_post_id'
  end

  create_table 'models', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_models_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_models_on_reset_password_token', unique: true
  end

  create_table 'posts', force: :cascade do |t|
    t.string 'title'
    t.text 'text'
    t.integer 'comments_counter'
    t.integer 'likes_counter'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'author_id', null: false
    t.index ['author_id'], name: 'index_posts_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'photo'
    t.text 'bio'
    t.integer 'posts_counter', default: 0
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.string 'role'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'comments', 'posts'
  add_foreign_key 'comments', 'users', column: 'author_id'
  add_foreign_key 'likes', 'posts'
  add_foreign_key 'likes', 'users', column: 'author_id'
  add_foreign_key 'posts', 'users', column: 'author_id'
end
