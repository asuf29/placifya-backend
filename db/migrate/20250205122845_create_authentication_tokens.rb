class CreateAuthenticationTokens < ActiveRecord::Migration[7.1]
  def change
    create_table :authentication_tokens do |t|
      t.references :user, null: false, foreign_key: true
      t.string :token, null: false
      t.datetime :expires_at, null: false

      t.timestamps
    end
  end
end
