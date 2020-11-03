require 'rails_helper'

RSpec.describe 'Todos', type: :request do
  let!(:project) { create(:project) }
  let!(:todo) { create(:todo, project: project) }

  describe 'GET #new' do
    context 'to fill data of new todo' do
      it do
        get "/projects/#{project.id}/todos", as: :json
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'PATCH #checked' do
    context 'to check the task' do
      it do
        patch "/projects/#{project.id}/todos/#{todo.id}", as: :json
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'POST #create' do
    context 'with valid attribute' do
      it do
        post "/projects/#{project.id}/todos", params: { text: 'To buy products' }, as: :json
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid attribute - empty text' do
      it do
        post projects_path, params: { text: '' }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'with invalid attribute - more than maximum signs in text' do
      it do
        post projects_path, params: { text: 'To buy products, to clean room and to go for a walk' }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
