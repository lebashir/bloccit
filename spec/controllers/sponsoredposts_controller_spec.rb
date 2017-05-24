require 'rails_helper'

RSpec.describe SponsoredpostsController, type: :controller do
  let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:my_sponsored) { my_topic.sponsoredposts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 10) }

  describe "GET #show" do
    it "returns http success" do
      get :show, topic_id: my_topic.id, id: my_sponsored.id
      expect(response).to have_http_status(:success)
    end
    it "renders the #show view" do
      get :show, topic_id: my_topic.id, id: my_sponsored.id
      expect(response).to render_template :show
    end
    it "assigns my_post to @post" do
      get :show, topic_id: my_topic.id, id: my_sponsored.id
      expect(assigns(:sponsoredPost)).to eq(my_sponsored)
    end
  end

  describe "GET new" do
      it "returns http success" do
        get :new, topic_id: my_sponsored.id
        expect(response).to have_http_status(:success)
      end

      it "renders the #new view" do
        get :new, topic_id: my_sponsored.id
        expect(response).to render_template :new
      end

      it "instantiates @sponsoredPost" do
        get :new, topic_id: my_sponsored.id
        expect(assigns(:sponsoredPost)).not_to be_nil
      end
    end

    describe "GET edit" do
      it "returns http success" do
        get :edit, topic_id: my_topic.id, id: my_sponsored.id
        expect(response).to have_http_status(:success)
      end
      it "renders the #edit view" do
        get :edit, topic_id: my_topic.id, id: my_sponsored.id
        expect(response).to render_template :edit
      end
      it "assigns sponsoredPost to be updated to @sponsoredPost" do
        get :edit, topic_id: my_topic.id, id: my_sponsored.id
        sponsored_instance = assigns(:sponsoredPost)

        expect(sponsored_instance.id).to eq my_sponsored.id
        expect(sponsored_instance.title).to eq my_sponsored.title
        expect(sponsored_instance.body).to eq my_sponsored.body
      end
    end

end
