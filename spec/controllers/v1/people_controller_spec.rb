require 'rails_helper'

RSpec.describe V1::PeopleController, type: :controller do

  describe 'Should create person with ' do
    before(:each) do
        edge = Edge.create(name: 'C')
    end

    it 'valid post params' do
      post :create, params: {
                              nome: 'John Doe',
                              profissao: 'Engenheiro de Software',
                              localizacao: 'C',
                              nivel: 2 }
      expect(response).to have_http_status(201)
      expect(response.body).to include_json(
        failed: 0)
    end

    it 'null params' do
      post :create
      expect(response).to have_http_status(400)
      expect(response.body).to include_json(
        failed: 1)
    end

    it 'incorrect params params' do
      post :create, params: {
                              nome: 'John Doe',
                              localizacao: 'C',
                              nivel: 2 }
      expect(response).to have_http_status(400)
      expect(response.body).to include_json(
        failed: 1)
    end

    it 'inexistent localization params params' do
      post :create, params: {
                              nome: 'John Doe',
                              profissao: 'Engenheiro de Software',
                              localizacao: 'T',
                              nivel: 2 }
      expect(response).to have_http_status(400)
      expect(response.body).to include_json(
        failed: 1)
    end
  end

end
