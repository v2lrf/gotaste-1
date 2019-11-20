# frozen_string_literal: true

class AreasController < ApplicationController
  def show
    @area = Area.find_by(slug: params[:id])
    page_meta[:name] = @area.name

    render locals: show_locals
  end

  private

  def show_locals
    {
      area: @area,
      area_has_children: @area.children.any?,
      area_children: Area.where(parent_id: @area.id)
    }
  end
end
