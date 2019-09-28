class CreateRecipesTable < ActiveRecord::Migration
  def change
    #recipes should have a name, ingredients, and cook_time
    create_table :recipes do |t|
      t.string :name
      t.string :ingredients
      t.string :cook_time
    end 
  end
end
