class Dose < ApplicationRecord
  validates :ingredient, uniqueness: { scope: :cocktail,
     message: "This cocktail/couple already exists" }
  belongs_to :ingredient
  belongs_to :cocktail
end
