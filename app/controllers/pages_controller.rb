class PagesController < ApplicationController

  def index
  end

  def members
    @authors = Author.all
  end

  def publications
    @publications = Publication.order(year: :desc).select do |publication|
      publication.publication_type != "livro" && publication.publication_type != "cartilha"
    end
  end

  def books
    @books = Publication.order(year: :desc).select do |publication|
      publication.publication_type == "livro"
    end

    @booklets = Publication.order(year: :desc).select do |publication|
      publication.publication_type == "cartilha"
    end
  end
end
