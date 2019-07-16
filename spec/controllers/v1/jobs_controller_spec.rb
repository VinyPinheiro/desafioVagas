require 'rails_helper'

RSpec.describe V1::JobsController, type: :controller do

    describe 'Should create job with ' do
      before(:each) do
          edge = Edge.create(name: 'A')
      end

      it 'valid post params' do
        post :create, params: {
                                empresa: 'Teste',
                                titulo: 'Vaga teste',
                                descricao: 'Criar os mais diferentes tipos de teste',
                                localizacao: 'A',
                                nivel: 3 }
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
                                empresa: 'Teste',
                                titulo: 'Vaga teste',
                                localizacao: 'A',
                                nivel: 3 }
        expect(response).to have_http_status(400)
        expect(response.body).to include_json(
          failed: 1)
      end

      it 'inexistent localization params params' do
        post :create, params: {
                                empresa: 'Teste',
                                titulo: 'Vaga teste',
                                descricao: 'Criar os mais diferentes tipos de teste',
                                localizacao: 'T',
                                nivel: 3 }
        expect(response).to have_http_status(400)
        expect(response.body).to include_json(
          failed: 1)
      end
    end

end
