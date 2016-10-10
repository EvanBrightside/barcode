class BarcodexmlsController < ApplicationController

  def new
    @barcodexml = Barcodexml.new
  end

  def create
    @barcodexml = Barcodexml.create(barcodexml_params)
    flash[:notice] = 'Файл успешно загружен'
    redirect_to new_barcodexml_url
  end

  private

  def barcodexml_params
    params.require(:barcodexml).permit(:title, :inn, :zipcode, :month, :start, :end, :xml)
  end
end
