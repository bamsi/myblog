require 'swagger_helper'

describe 'Blogs API' do

  path '/users/{id}' do

    get 'Retrieves a users posts' do
      tags 'Users posts'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'Posts found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            photo: { type: :string }
          },
          required: [ 'id', 'name', 'photo' ]

        let(:id) { User.create(name: 'foo', photo: 'bar').id }
        run_test!
      end

      response '404', 'Posts not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end
  end
end