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
 describe 'user deletes an article' do
   describe 'they link from the show page'do
     it "displays all the articles without the deleted entry" do
       article_1 = Article.create!(title: "Title 1", body: "Body 1")
       article_2 = Article.create!(title: "Title 2", body: "Body 2")

       visit article_path(article_1)
       click_link('Delete')

       expect(current_path).to eq(articles_path)
       expect(page).to have_content(article_2.title)
       expect(page).to_not have_link(article_1.title)
       expect(page).to have_content("Article New Title! Deleted!")
     end
   end
 end
