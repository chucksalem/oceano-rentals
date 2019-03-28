# frozen_string_literal: true

class PropertiesController < ApplicationController
  DATE_FORMAT = '%m/%d/%Y'

  def index
    @area       = params[:area] || 'all'
    @start_date = params[:start_date]
    @end_date   = params[:end_date]
    @guests     = params[:guests]
    @beachfront = params[:beachfront] || 'all'
    @sort       = params[:sort] || 'P'

    if search_request?
      search_results
    else
      units = UnitRepository.random_units(limit: 10)
      @units = WillPaginate::Collection.create((params[:page] || 1).to_i, 10, units.count) do |pager|
        pager.replace(units[pager.offset, pager.per_page].to_a)
      end
    end
  end

  def properties
    @sort = params[:sort] || 'P'

    if search_request?
      search_results
    else
      @units = UnitRepository.random_units(limit: 100)
    end
  end

  # rubocop:disable Metrics/AbcSize
  def show
    @id                = params[:id]
    @booking_id        = params[:id].to_str.split('-', 2).last
    @unit              = UnitRepository.get(@id)
    @property_title    = @unit.name
    @property_subtitle = @unit.address[:street]
    @amenities         = @unit.available_amenities
    @guests            = params[:guests] || 1
    @guest_amount_list = (1..@unit.occupancy).map { |v| v }
    @start_date        = !params[:start_date].blank? ? params[:start_date] : Date.today.strftime(DATE_FORMAT)
    @end_date          = !params[:end_date].blank? ? params[:end_date] : (Date.today + 7).strftime(DATE_FORMAT)
    @random_units      = UnitRepository.random_units(limit: 3, except: [@id])
    @reviews           = Review.where(unit_id: @id)

    lookup_rates if %i[start_date end_date guests].all? { |k| params.key?(k) && !params[k].blank? }
    images
  end
  # rubocop:enable Metrics/AbcSize

  private

  def search_request?
    %i[area start_date end_date guests beachfront].any? { |k| params.key?(k) && !params[k].empty? }
  end

  # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  def search_results
    start_date = params[:start_date]
    end_date = params[:end_date]
    date_range =
      if [start_date, end_date].all?(&:present?)
        {
          start: Date.strptime(start_date, DATE_FORMAT),
          end: Date.strptime(end_date, DATE_FORMAT)
        }
      end

    codes = []
    OceanoConfig[:cache_population_searches].each do |criteria|
      criteria[:sort]       = params[:sort] || 'G'
      criteria[:sort]       = 'G' if criteria[:sort] == '-'
      if date_range
        criteria[:date_range] = date_range
      else
        criteria.delete(:date_range)
      end
      criteria[:guests] = [{ type: 10, count: params[:guests] }] unless [nil, '', 'all'].include?(params[:guests])

      codes += UnitRepository.search(criteria)
    end

    codes = codes.uniq

    unless params[:area] == 'all' || params[:area].blank?
      in_area_codes = UnitRepository.units_in_area(params[:area])
      codes &= in_area_codes
    end

    units = codes.map do |c|
      UnitRepository.get(c)
    end

    units = apply_beachfront_filter(units, params[:beachfront])

    @units = WillPaginate::Collection.create((params[:page] || 1).to_i, 10, units.count) do |pager|
      pager.replace(units[pager.offset, pager.per_page].to_a)
    end
  end
  # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

  def lookup_rates
    @lookup         = true
    @available      = true
    start_date      = Date.strptime(@start_date, DATE_FORMAT)
    end_date        = Date.strptime(@end_date, DATE_FORMAT)
    @length_of_stay = end_date.mjd - start_date.mjd
    @guests         = @guests == 'all' ? 1 : @guests

    @rates = Stay.lookup(@id,
                         start_date: start_date,
                         end_date: end_date,
                         guests: @guests)

    @nightly_rate      = format('%.2f', (@rates.base_amount / @length_of_stay))
    @base_amount       = format('%.2f', @rates.base_amount)
    @tax_amount        = format('%.2f', @rates.taxes[0].amount)
    @fees              = @rates.fees
    @total_amount      = format('%.2f', @rates.total_amount)
  rescue Stay::Unavailable
    @available = false
  end

  def images
    @videos = @unit.videos
    @standard_images = @unit.standard_images
    @large_images = @unit.large_images
  end

  # rubocop:disable Lint/UselessAccessModifier
  private

  def apply_beachfront_filter(units, beachfront)
    return units if %w[true false].exclude?(beachfront)

    method = beachfront == 'true' ? :select : :reject
    units.public_send(method, &:beachfront)
  end
  # rubocop:enable Lint/UselessAccessModifier
end
