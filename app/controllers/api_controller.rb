class ApiController < ApplicationController
  def get_api_version
    data = Storage.find_by_key("api_version")
    response.headers['Content-type'] = "text/plain; charset=utf-8"
    render :json => { :message => data[:value] }, :status => :ok
  end

  def get_categories
    data = Category.all
    response.headers['Content-type'] = "text/plain; charset=utf-8"
    render :json => { :message => data.to_json }, :status => :ok
  end

  def get_tags
    data = Tag.all
    response.headers['Content-type'] = "text/plain; charset=utf-8"
    render :json => { :message => data.to_json }, :status => :ok
  end

  def get_ingredients
    data = Ingredient.all
    response.headers['Content-type'] = "text/plain; charset=utf-8"
    render :json => { :message => data.to_json }, :status => :ok
  end

  def get_recipes
    conditions = {}
    conditions.merge!(:category_id => params[:category_id]) if params[:category_id].present?
    conditions.merge!(:tag_id => params[:tag_id]) if params[:tag_id].present?
    conditions.merge!(:ingredient_id => params[:ingredient_id]) if params[:ingredient_id].present?

    data = Recipe.all(:conditions => conditions)
    response.headers['Content-type'] = "text/plain; charset=utf-8"
    render :json => { :message => data.to_json }, :status => :ok
  end
end
