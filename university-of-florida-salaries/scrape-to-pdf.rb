require 'bundler'
Bundler.require

pdf_path = ARGV[0]

reader = PDF::Reader.new(pdf_path)

pages = reader.page_count

$stderr.puts "reading #{pdf_path} with #{pages} pages."

data = []

reader.pages.each_with_index do |page, i|
  page.text.split("\n").each do |line|
    # remove commas and split on 2+ whitespaces
    line = line.tr(',', '').split(/[\s]{2,}/)

    # "heuristics"
    if (line.size.between?(5, 6)) \
        and (line.last != 'RATE') \
        and (line.first != 'PAYPLAN') \
        and (line.first != 'DEBT') \
        and (line.last != 'CURRENT')
      # remove empty fields (only happens on newer PDFs where first field is empty)
      data.reject! &:empty?
      data << line
    end
  end
  $stderr.write "\r#{data.size} records from #{i} of #{pages} (#{'%.2f %%' % (100*i/pages.to_f)})"
end

$stderr.puts "found #{data.size} records"

data.each do |row|
  puts row.join(',')
end
