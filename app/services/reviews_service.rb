require 'roo'

class ReviewsService
  ALLOWED_TYPES = %w[.xls .xlsx .xlsm].freeze

  attr_reader :result

  def initialize(file)
    @file = file
    @result = {}
  end

  def call
    validate_file_type!

    spreadsheet = Roo::Spreadsheet.open(file)
    validate_data_presence!(spreadsheet)

    Review.transaction do
      add_reviews!(spreadsheet)
    end

    result[:success] = 'Reviews have been successfully uploaded!'
  rescue StandardError => e
    result[:error] ||= e.message
  ensure
    return self
  end

  private

  attr_reader :file

  def validate_file_type!
    return if File.extname(file).in? ALLOWED_TYPES

    raise "Error! Invalid file type. Allowed types: #{ALLOWED_TYPES.join(', ')}."
  end

  def validate_data_presence!(spreadsheet)
    raise 'Error! File can not be empty.' if spreadsheet.first_row.blank?

    spreadsheet.each_row_streaming(pad_cells: true).with_index(1) do |row, row_number|
      validate_row_data_presence!(row, row_number)
    end
  end

  def validate_row_data_presence!(row, row_number)
    { 0 => 'first name', 2 => 'unit id' }.each do |column_number, column_name|
      (raise "Error! Row №#{row_number}: #{column_name} can not be empty!") if row[column_number].blank?
    end
  end

  def add_reviews!(spreadsheet)
    spreadsheet.each_row_streaming(pad_cells: true).with_index(1) do |row, row_number|
      review = Review.new
      review.first_name  = parse_first_name!(row)
      review.last_name   = parse_last_name!(row)
      review.unit_id     = parse_unit_id!(row)
      review.description = parse_description!(row)
      review.rating      = parse_rating!(row)

      review.save!
    end
  end

  def parse_first_name!(row)
    row[0].value.to_s
  end

  def parse_last_name!(row)
    row[1].value.to_s
  end

  def parse_unit_id!(row)
    code = row[2].value.to_s
    raw = RedisClient.get("units:#{code}")
    raise "Error! Unit not found" if raw.nil?
    code
  end

  def parse_description!(row)
    row[3].value.to_s
  end

  def parse_rating!(row)
    row[4].value.to_i
  end
end
