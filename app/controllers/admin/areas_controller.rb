# frozen_string_literal: true

module Admin
  class AreasController < BaseController
    before_action :find_area!, only: %w[edit update]

    def index
      @areas = Area.all
    end

    def new
      @area = Area.new
    end

    def create
      @area = Area.new(area_params)

      if @area.save
        redirect_to edit_admin_area_path(@area)
      else
        render :new
      end
    end

    def edit
      page_meta[:name] = @area.name
    end

    def update
      if @area.update(area_params)
        redirect_to edit_admin_area_path(@area.id)
      else
        render :edit
      end
    end

    private

    def find_area!
      @area = Area.find(params[:id])
    end

    def area_params
      params.require(:area).permit(
        :name,
        :latitude,
        :longitude,
        :parent_id,
        :description
      )
    end
  end
end
