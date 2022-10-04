require 'rails_helper'

 RSpec.describe 'user sees one article' do
   describe 'they link from the article index' do
     it "displays information for one article" do
       article = Article.create!(title: "New Title", body: "New Body")

       visit articles_path

       click_link article.title

       expect(page).to have_content(article.title)
       expect(page).to have_content(article.body)
     end
   end
 end