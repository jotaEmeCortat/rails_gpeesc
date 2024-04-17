class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show, :edit, :update, :destroy]

  # def index
  #   @publications = Publication.order(year: :desc).all
  # end

  def show
  end

  def new
    @publication = Publication.new
    @authors = Author.all
  end

  def edit
    @authors = Author.all
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

  private
  def set_publication
    @publication = Publication.friendly.find(params[:id])
  end

  def publication_params
    params.require(:publication).permit(:title, :year, :abstract, :theme, :publication_type, author_ids: [])
  end
end
