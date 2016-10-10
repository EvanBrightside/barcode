require 'rails_helper'

RSpec.describe BarcodexmlsController do
  describe '#new' do
    subject do
      get :new
      response
    end

    it { is_expected.to be_success }
    it { is_expected.to render_template :new }
    it { is_expected.to have_http_status(200) }
  end
end
