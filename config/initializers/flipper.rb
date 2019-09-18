# frozen_string_literal: true

Flipper.configure do |config|
  config.default { Flipper.new Flipper::Adapters::ActiveRecord.new }
end
