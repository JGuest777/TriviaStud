require 'rails_helper'

RSpec.describe "Questions", type: :request do
  it 'should successfully render the Index page' do
    get '/'
    expect(response).to have_http_status (:success)
  end
end
