# frozen_string_literal: true

json.units do
  json.array! @units do |unit|
    json.partial! 'api/shared/unit', unit: unit
  end
end
