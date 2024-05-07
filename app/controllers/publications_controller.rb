class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show, :edit, :update, :destroy]

  # def index
  #   @publications = Publication.order(year: :desc).all
  # end

  def show
  end

  def new
    @publication = Publication.new
    @publication.repositories.build
  end

  def edit
  end

  def create
    @publication = Publication.new(publication_params)

    if @publication.save
      redirect_to @publication
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @publication.update(publication_params)
      redirect_to @publication
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @publication.authors.clear
    @publication.destroy
    if @publication.publication_type == "livro" || @publication.publication_type == "cartilha"
      redirect_to livros_path, status: :see_other
    else
      redirect_to publicacoes_path, status: :see_other
    end
  end

  # def available_authors
  #   existing_author_ids = params[:existing_author_ids].split(',').map(&:to_i)
  #   @available_authors = Author.where.not(id: existing_author_ids)
  #   respond_to do |format|
  #     format.json { render json: @available_authors }
  #   end
  # end

  private
  def set_publication
    @publication = Publication.friendly.find(params[:id])
  end

  def publication_params
    params.require(:publication).permit(:title, :year, :abstract, :theme, :publication_type, repositories_attributes: [:id, :author_id, :_destroy])
  end
end
