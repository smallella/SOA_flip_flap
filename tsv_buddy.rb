# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # Converts a String with TSV data into internal data structure @data
  # arguments: tsv - a String in TSV format
  # returns: nothing
  # def take_tsv(tsv); end
  def take_tsv(tsv)
    @data = []
    rows = tsv.strip.split("\n")
    headers = rows[0].split("\t")

    rows[1..].each do |row|
      values = row.split("\t")
      @data << Hash[headers.zip(values)]
    end
  end

  # Converts @data into tsv string
  # arguments: none
  # returns: String in TSV format
  #   def to_tsv; end
  # end
  def to_tsv
    return '' if @data.empty?

    headers = @data[0].keys.join("\t")
    rows = @data.map { |hash| hash.values.join("\t") }
    "#{[headers, rows].join("\n")}\n"
  end
end
