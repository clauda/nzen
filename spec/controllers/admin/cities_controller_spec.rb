require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe Admin::CitiesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # City. As you add validations to City, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { name: "Parnamirim", state: "RN" }
  }

  let(:invalid_attributes) { { name: nil } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CitiesController. Be sure to keep this updated too.
  let(:user){ FactoryGirl.create(:user) }
  let(:valid_session) { sign_in user }

  describe "GET #index" do
    it "assigns all cities as @cities" do
      city = City.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:cities)).to include(city)
    end
  end

  describe "GET #show" do
    it "assigns the requested city as @city" do
      city = City.create! valid_attributes
      get :show, params: {id: city.to_param}, session: valid_session
      expect(assigns(:city)).to eq(city)
    end
  end

  describe "GET #new" do
    it "assigns a new city as @city" do
      get :new, params: {}, session: valid_session
      expect(assigns(:city)).to be_a_new(City)
    end
  end

  describe "GET #edit" do
    it "assigns the requested city as @city" do
      city = City.create! valid_attributes
      get :edit, params: {id: city.to_param}, session: valid_session
      expect(assigns(:city)).to eq(city)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new City" do
        expect {
          post :create, params: {city: valid_attributes}, session: valid_session
        }.to change(City, :count).by(1)
      end

      it "assigns a newly created city as @city" do
        post :create, params: {city: valid_attributes}, session: valid_session
        expect(assigns(:city)).to be_a(City)
        expect(assigns(:city)).to be_persisted
      end

      it "redirects to the created city" do
        post :create, params: {city: valid_attributes}, session: valid_session
        expect(response).to redirect_to([:admin,City.last])
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved city as @city" do
        post :create, params: {city: invalid_attributes}, session: valid_session
        expect(assigns(:city)).to be_a_new(City)
      end

      it "re-renders the 'new' template" do
        post :create, params: {city: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested city" do
        city = City.create! valid_attributes
        put :update, params: {id: city.to_param, city: new_attributes}, session: valid_session
        city.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested city as @city" do
        city = City.create! valid_attributes
        put :update, params: {id: city.to_param, city: valid_attributes}, session: valid_session
        expect(assigns(:city)).to eq(city)
      end

      it "redirects to the city" do
        city = City.create! valid_attributes
        put :update, params: {id: city.to_param, city: valid_attributes}, session: valid_session
        expect(response).to redirect_to([:admin,city])
      end
    end

    context "with invalid params" do
      it "assigns the city as @city" do
        city = City.create! valid_attributes
        put :update, params: { id: city.to_param, city: invalid_attributes }, session: valid_session
        expect(assigns(:city)).to eq(city)
      end

      it "re-renders the 'edit' template" do
        city = City.create! valid_attributes
        put :update, params: {id: city.to_param, city: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested city" do
      city = City.create! valid_attributes
      expect {
        delete :destroy, params: {id: city.to_param}, session: valid_session
      }.to change(City, :count).by(0)
    end

    it "redirects to the cities list" do
      city = City.create! valid_attributes
      delete :destroy, params: {id: city.to_param}, session: valid_session
      expect(response).to redirect_to(admin_cities_url)
    end
  end

end