require 'rails_helper'

RSpec.describe Barcodexml do
  describe '#parse_file' do

    let(:doc) { Nokogiri::XML(open(Rails.root + 'spec/assets/123.xml')) }

    it 'parse_xml' do
      inn = doc.xpath('ns:Range').attr('Inn').text
      expect(inn).to eq('290123790224')
    end
  end
end
