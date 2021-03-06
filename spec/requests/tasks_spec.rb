require 'rails_helper'

describe 'Tasks', type: :request do
  fixtures :organizations

  let(:data)       { { data: { attributes: attributes, relationships: relationships } } }
  let(:attributes) { { title: title, recurrence: recurrence } }
  let(:title)      { "Task title" }
  let(:recurrence) { 2 }
  let(:relationships) { { organization: organization } }
  let(:organization) { { data: { id: organizations(:singularities).id, type: 'organization' } } }

  describe 'create task' do
    let(:method) { :post }
    let(:path)   { '/tasks' }

    it_behaves_like "it returns an unauthorized error"

    with_valid_user_and_token do
      context 'when there is missing data' do
        let(:title) { nil }

        it_behaves_like "it returns an unprocessable error"
      end

      it_behaves_like "is a valid request"
    end
  end
end
