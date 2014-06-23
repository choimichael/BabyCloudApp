require 'spec_helper'

describe PostsController do
  let :valid_attributes do
    {
      :image => "image/jpeg"
    }
  end
  describe "GET index" do
    before do
      get :index
    end

    it "should render the index template" do
      expect(response).to render_template :index
    end
  end

  describe "GET new" do
    before do
      get :new
    end

    it "should render the new template" do
      expect(response).to render_template :new
    end
  end

  describe "POST create" do
    before do
      post :create
    end
 
    it "should upload a file" do
      attached_file "uploadfile(id of field)"
      click_button "Upload File"
      post :create, image: valid_attributes
    end
  end

end
