class Barcodexml < ActiveRecord::Base
  attr_accessor :xml
  before_save :parse_file

  def parse_file
    doc = Nokogiri::XML(xml.read)
    parse_xml(doc)
  end

  def parse_xml(doc)
    self.inn = doc.xpath('ns:Range').attr('Inn').text
    self.month = doc.xpath('ns:Range/ns:Segment').attr('NumMonth').text.last(2)
    self.zipcode = doc.xpath('ns:Range').attr('IndexFrom').text
    self.start = doc.xpath('ns:Range/ns:Segment').attr('NumBeg').text
    self.end = doc.xpath('ns:Range/ns:Segment').attr('NumEnd').text
  end
end
