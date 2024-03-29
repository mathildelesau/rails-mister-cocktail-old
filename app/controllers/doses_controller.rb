class DosesController < ApplicationController
 before_action :set_cocktail, only: [:new, :create]
 before_action :set_dose, only: [:edit, :update, :destroy]

 def new
   @cocktail = Cocktail.find(params[:cocktail_id])
   @dose = Dose.new
 end

 def create
   @dose = Dose.new(dose_params)
   @dose.cocktail = Cocktail.find(params[:cocktail_id])
   if @dose.save
     redirect_to cocktail_path(@cocktail)
   else
     render :new
   end
 end

 def destroy
   @dose.destroy
 end

 private

 def dose_params
   params.require(:dose).permit(:description, :ingredient_id)
 end

 def set_dose
   @dose = Dose.find(params[:id])
 end

 def set_cocktail
   @cocktail = Cocktail.find(params[:cocktail_id])
 end
end
