require 'rails_helper'

RSpec.describe "Posts", type: :request do
  # index action
    context 'Get #index' do
        it "returns a success responce" do
            get "/posts"
            expect(response).to have_http_status(200)
        end
    end

  # create action 
  context 'Post #create' do
    it "returns a success responce" do
      post "/posts", :params => { :post => { :name => "Any name", :title => "Any title", :content => "Any content" }}
      expect(response).to have_http_status(302)
    end
  end

  #show action
  context 'Get #show' do
    it "returns a success responce" do
      post = Post.create!(name:"name", title:"title", content:"content")
      get "/posts", params: {id: post.to_param}
      expect(response).to have_http_status(200)
    end
  end

  # delete action
  context 'Delete #delete' do
    it "returns a success responce" do
      post = Post.create!(name:"name", title:"title", content:"content")
      delete "/posts", params: {id: post.to_param}
      expect(response).to have_http_status(200)
    end
  end
end


