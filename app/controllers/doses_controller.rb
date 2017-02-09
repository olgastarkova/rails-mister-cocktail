class DosesController < ApplicationController
  before_action :choose_cocktail, only: [ :new, :create ]
  before_action :choose_ingredient, only: [ :create ]
  def new
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.ingredient = @ingredient
    if @dose.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    cocktail = @dose.cocktail
    @dose.delete
    redirect_to cocktail_path(cocktail)
  end

  private
  def choose_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def choose_ingredient
    @ingredient = Ingredient.find(params[:dose][:ingredient_id])
  end

  def dose_params
    params.require(:dose).permit(:description)
  end



end
