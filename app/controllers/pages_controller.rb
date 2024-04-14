class PagesController < ApplicationController

  def index
  end

  def members
    @authors = Author.all
  end

  def publications
  end

  def books
  end
end
