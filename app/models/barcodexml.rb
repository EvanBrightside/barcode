class Barcodexml < ActiveRecord::Base
  has_attached_file :xml
  before_save :parse_file

  def parse_file
    tempfile = xml.queued_for_write[:original]
    doc = Nokogiri::XML(tempfile)
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
