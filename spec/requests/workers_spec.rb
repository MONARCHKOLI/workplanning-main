require 'rails_helper'

RSpec.describe "Workers", type: :request do
  
  let!(:worker) {create(:worker)}
  describe "GET /index" do
    it "qasf" do
      get "/"
      expect(assigns(:workers)).to eq([worker])
    end
  end
  describe "GET #show" do
    it "shows details @worker" do
      get "/workers/#{worker.id}"
      expect(response).to render_template(:show)
    end
  end 
  
  describe "GET /new" do
    it "renders a successful response" do
      get new_worker_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    let!(:worker) {create(:worker)}
    it "with valid parameters" do
      post "/workers",params: {worker:{name:"abcd",date:"12/12/2023",shift:"Shift-2"} }
      expect(response).to redirect_to(assigns(:worker))
    end
    it "with invalid parameters" do
      get new_worker_url(worker) ,params: {worker:{name:""}}
      expect(response).to render_template(:new) 
    end
  end

  describe "GET /edit" do
    it "render a successful response with valida parameters" do
      get edit_worker_url(worker)
      expect(response).to be_successful
    end
  end

  describe "PUT /update/:id" do 
    it "update the worker details with valid parameters" do
      put "/workers/#{worker.id}", params: {worker:{name:"xyz"}}
      expect(response).to redirect_to(assigns(:worker))
    end
    it "with invalid parameters" do
      get edit_worker_url(worker) ,params: {worker:{name:""}}
      expect(response).to render_template(:edit) 
    end

  end    
  describe "DELETE /destroy " do
    it "delete the worker" do
      get "/"
      expect(response).to  have_http_status(:ok)
    end
  end
end
