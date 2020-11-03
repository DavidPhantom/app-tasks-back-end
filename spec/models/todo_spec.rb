# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Todo, type: :model do
  let!(:project) { create(:project) }

  subject! { create(:todo, project: project) }

  it { expect(build(:todo)).to be_valid }

  describe 'ActiveModel' do
    context 'attributes' do
      it do
        subject.text = '   '
        expect(subject).not_to be_valid
      end

      it do
        subject.text = 'a' * 26
        expect(subject).not_to be_valid
      end

      it do
        subject.project = nil
        expect(subject).not_to be_valid
      end

      it { assert_equal subject.project.id, project.id }

      it do
        subject.isCompleted = true
        expect(subject).to be_valid
      end

      it do
        subject.isCompleted = false
        expect(subject).to be_valid
      end

      it { assert_equal false, subject.isCompleted }
    end
  end
end
