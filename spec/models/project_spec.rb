# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Project, type: :model do
  subject! { create(:project) }

  it { expect(build(:project)).to be_valid }

  describe 'ActiveModel' do
    context 'attributes' do
      it do
        subject.title = '     '
        expect(subject).not_to be_valid
      end

      it do
        subject.title = 'a' * 16
        expect(subject).not_to be_valid
      end

      it do
        subject.save
        subject.todos.create!(text: 'To buy products')
        # assert_difference 'Todo.count', -1 do
        #   subject.destroy
        # end
        expect { subject.destroy }.to change(Todo, :count).by(-1)
      end
    end
  end
end
