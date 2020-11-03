require 'rails_helper'

RSpec.describe 'Projects', type: :request do
  describe 'GET #index' do
    context 'list of all projects' do
      it do
        get projects_path, as: :json
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #new' do
    context 'to fill data of new project' do
      it do
        get new_project_path, as: :json
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'POST #create' do
    context 'with valid attribute' do
      it do
        post projects_path, params: { title: 'Family' }, as: :json
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid attribute - empty title' do
      it do
        post projects_path, params: { title: '' }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'with invalid attribute - more than maximum signs in title' do
      it do
        post projects_path, params: { title: 'Family Guy go for a walk' }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
