require "rails_helper"

RSpec.describe InscricoesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/inscricoes").to route_to("inscricoes#index")
    end

    it "routes to #new" do
      expect(get: "/inscricoes/new").to route_to("inscricoes#new")
    end

    it "routes to #show" do
      expect(get: "/inscricoes/1").to route_to("inscricoes#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/inscricoes/1/edit").to route_to("inscricoes#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/inscricoes").to route_to("inscricoes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/inscricoes/1").to route_to("inscricoes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/inscricoes/1").to route_to("inscricoes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/inscricoes/1").to route_to("inscricoes#destroy", id: "1")
    end
  end
end
