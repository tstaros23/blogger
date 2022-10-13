require 'rails_helper'

 RSpec.describe 'user edits an article' do
   describe 'they link from the show page' do
     it "can edit article attributes" do
       article_1 = Article.create!(title: "Title 1", body: "Body 1")

       visit "/articles/#{article_1.id}"

       click_link 'Edit'
       expect(current_path).to eq(edit_article_path(article_1))

       fill_in "article[title]", with: "New Title!"
       fill_in "article[body]", with: "New Body!"

       click_on "Update Article"

       expect(article_1.title).to eq("New Title")
       expect(article_1.body).to eq("New Body!")
     end
   end
 end
