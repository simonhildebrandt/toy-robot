require_relative 'field'

class Runner
  def initialize(path)
    raise ArgumentError unless File.exists? path

    @results = []
    run_instructions_from_file(path)
  end

  def report
    @results.join("\n")
  end

  private

  def run_instructions_from_file(path)
    open(path, 'rb').each do |line|
      parse_command(line.strip)
    end
  end

  def parse_command(line)
    if line.match(/\APLACE (\d),(\d),(NORTH|SOUTH|EAST|WEST)\Z/)
      field.place($1.to_i, $2.to_i, $3)
    elsif line.match(/\AMOVE\Z/)
      field.move
    elsif line.match(/\ALEFT\Z/)
      field.turn(:left)
    elsif line.match(/\ARIGHT\Z/)
      field.turn(:right)
    elsif line.match(/\AREPORT\Z/)
      update_report
    end
  end

  def update_report
    if field.report
      @results << field.report.join(",")
    end
  end

  def field
    @field ||= Field.new
  end
end
