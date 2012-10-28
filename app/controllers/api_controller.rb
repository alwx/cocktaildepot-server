class ApiController < ApplicationController
  def get_value
    data = Storage.find_by_key(params[:value])

    render :json => { :response => data[:value] }
  end

  def get_categories
    data = Category.all

    respond_to do |format|
      format.html { render :json => data.to_json(
          :only => [:id, :name, :description],
          :methods => [:thumb_image]
      ) }
    end
  end

  def get_tags
    data = Tag.all

    respond_to do |format|
      format.html { render :json => data.to_json(
          :only => [:id, :name, :description]
      ) }
    end
  end

  def get_ingredients
    data = Ingredient.where(:is_main => true).all

    respond_to do |format|
      format.html { render :json => data.to_json(
          :only => [:id, :name, :description],
          :methods => [:thumb_image]
      ) }
    end
  end

  def get_recipes
    if params[:category_id].present?
      data = Recipe.all(:conditions => {:category_id => params[:category_id]})
    elsif params[:ingredient_id].present?
      data = Recipe.joins(:ingredients).where("ingredients.id" => params[:ingredient_id]).all
    end

    respond_to do |format|
      format.html { render :json => data.to_json(
          :only => [:id, :name],
          :methods => [:thumb_image],
          :include => {
              :category => { :only => [:id, :name] },
              :ingredients => { :only => [:id, :name] },
              :tags => { :only => [:id, :name] } }
          ) }
    end
  end

  def get_single_recipe
    data = Recipe.find_by_id(params[:id])

    respond_to do |format|
      format.html { render :json => data.to_json(
          :only => [:id, :name, :description],
          :methods => [:full_image],
          :include => {
              :category => { :only => [:id, :name] },
              :ingredients => { :only => [:id, :name] },
              :tags => { :only => [:id, :name] } }
      ) }
    end
  end
end
