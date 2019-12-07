# frozen_string_literal: true

class PagesController < ApplicationController
  def show
    @page = Page.published.find_by!(slug: params[:path])
    page_meta[:title] = @page.title
    page_meta[:description] = @page.description
  end

  def about; end
end
