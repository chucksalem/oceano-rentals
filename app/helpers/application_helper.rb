# frozen_string_literal: true

module ApplicationHelper
  def areas
    OceanoConfig[:areas].map do |a|
      { key: a.tr(' ', '').underscore, name: a }
    end
  end

  def sort_by
    [
      ['Guest Rating', 'G'],
      %w[Price P],
      %w[Location L],
      %w[Name N]
    ]
  end

  def ellipsis(str, length:)
    str[0..length].gsub(/\s\w+\s*$/, '...')
  end
end
