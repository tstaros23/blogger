require 'rails_helper'

 RSpec.describe 'user edits an article' do
   describe 'they link from the show page' do
     it "can edit article attributes" do
       article_1 = Article.create!(title: "Title 1", body: "Body 1")

       visit "/articles/#{article_1.id}"

       click_link 'Edit'

       fill_in "article[title]", with: "New Title!"

       expect(article_1.title).to eq("New Title")
       expect(article_1.body).to eq("Body 1")
     end
   end
 end
