class ProductionsController < ApplicationController
  wrap_parameters format: []
  def index
    render json: Production.all, status: :ok
  end

  def show
    production = Production.find_by(id: params[:id])
    if production
      # using except to create a custom render
      render json: production, except: [:id, :created_at, :updated_at], methods: [:title_director], status: :ok

      # using only to create a cutom render
      # render json: production, only: [:title, :genre, :budget, :image, :director, :ongoing], status: :ok

      # creating a custom render manually
      # render json: {
      #   title: production.title,
      #   genre: production.genre,
      #   budget: production.budget,
      #   image: production.image,
      #   director: production.director,
      #   ongoing: production.ongoing,
      #   }, status: :ok # creating our custom render here
    else
      render json: { error: "production not found" }, status: :not_found
    end
  end

  def create
    production = Production.create(production_params)
    render json: production, status: :created
  end

  def update
    production = Production.find_by(id: params[:id])
    if production
      production.update(production_params)
      render json: production, status: :accepted
    else
      render json: { error: "production not found" }, status: :not_found
    end
  end

  def destroy
    production = Production.find_by(id: params[:id])
    if production
      production.destroy
      head :no_content
    else
      render json: { error: "production not found" }, status: :not_found
    end
  end

  private

  # permiting the parameters that should have edit and write access on the db linked to the top line of the doc.
  def production_params
    params.permit(:title, :genre, :budget, :image, :director, :ongoing, :description)
  end

end
