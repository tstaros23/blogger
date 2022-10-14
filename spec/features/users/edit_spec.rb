require 'rails_helper'

 RSpec.describe 'user edits an article' do
   describe 'they link from the show page' do
     it "can edit article attributes" do
       article_1 = Article.create!(title: "Title 1", body: "Body 1")

       visit article_path(article_1)

       click_link 'Edit'
       expect(current_path).to eq(edit_article_path(article_1))

       fill_in "article[title]", with: "New Title!"
       fill_in "article[body]", with: "New Body!"

       click_on "Update Article"

       expect(current_path).to eq(article_path(article_1))
       expect(page).to have_content("New Title!")
       expect(page).to have_content("New Body!")
       expect(page).not_to have_content("Title 1")
       expect(page).not_to have_content("Body 1")
       expect(page).to have_content("Article New Title! Updated!")
     end
   end
 end
