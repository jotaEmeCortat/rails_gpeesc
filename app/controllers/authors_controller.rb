class AuthorsController < ApplicationController
  before_action :set_author, only: %i[ show edit update destroy ]

  def index
    @authors = Author.order(:name).select do |author|
      author.member == true
    end
  end

  def show
  end

  def new
    @author = Author.new
  end

  def edit
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to @author
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @author.update(author_params)
      redirect_to @author
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def set_author
    @author = Author.friendly.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name, :academic_degree, :lattes, :avatar_img, :member)
  end
end
