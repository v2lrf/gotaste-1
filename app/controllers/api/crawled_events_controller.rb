# frozen_string_literal: true

module Api
  class CrawledEventsController < BaseController
    def create
      crawled_event = CrawledEvent.new(create_params)

      if crawled_event.save
        head :created
      else
        render json: crawled_event.errors.full_messages,
               status: :unprocessable_entity
      end
    end

    private

    # rubocop:disable Metrics/MethodLength
    def create_params
      params.require(:crawled_event).permit(
        :place_id,
        :url,
        :name,
        :date,
        :time,
        :link,
        :where,
        :location,
        :image_url,
        :description,
        :source
      )
    end
    # rubocop:enable Metrics/MethodLength
  end
end
