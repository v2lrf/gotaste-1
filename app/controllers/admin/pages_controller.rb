# frozen_string_literal: true

module Admin
  class PagesController < BaseController
    before_action :find_page!, only: %w[edit update]

    def index
      @pages = Page.all
    end

    def new
      @page = Page.new
    end

    def create
      @page = Page.new(page_params)

      if @page.save
        redirect_to edit_admin_page_path(@page)
      else
        render :new
      end
    end

    def edit
      page_meta[:title] = @page.title
    end

    def update
      if @page.update(page_params)
        redirect_to edit_admin_page_path(@page.id)
      else
        render :edit
      end
    end

    private

    def find_page!
      @page = Page.find(params[:id])
    end

    def page_params
      params.require(:page).permit(:title, :description, :published)
    end
  end
end
