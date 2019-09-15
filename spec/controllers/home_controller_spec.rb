# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  it 'renders the index template' do
    get :index
    expect(response).to render_template :index
  end
end
