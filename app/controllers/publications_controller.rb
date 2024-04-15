class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show, :edit, :update, :destroy]

  def index
    @publications = Publication.order(:year).all
  end

  def show
  end

  def new
    @publication = Publication.new
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
    @publication.destroy
    redirect_to publications_url
  end

  private
  def set_publication
    @publication = Publication.friendly.find(params[:id])
  end

  def publication_params
    params.require(:publication).permit(:title, :year, :abstract, :theme, :category)
  end
end
