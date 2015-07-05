require 'bundler'
Bundler.require

pdf_path = ARGV[0]

reader = PDF::Reader.new(pdf_path)

pages = reader.page_count

$stderr.puts "reading #{pdf_path} with #{pages} pages."

data = []

reader.pages.each_with_index do |page, i|
  page.text.split("\n").each do |line|
    line = line.split(/[\s]{2,}/)
    if (line.size == 6) and (line[-1] != 'RATE')
      data << line
    end
  end
  $stderr.write "\r#{i} of #{pages} (#{'%.2f %%' % (100*i/pages.to_f)})"
end

data.each do |row|
  puts row.join(',')
end
