require 'rails_helper'

 RSpec.describe 'user creates a new article' do
   describe 'they link from the articles index' do
     describe 'they fill in a tile and body' do
       it 'creates a new article' do
         visit articles_path
         click_link "Create a New Article"

         expect(current_path).to eq(new_article_path)

         fill_in "article[title]", with: "New Title!"
         fill_in "article[body]", with: "New Body!"
         click_on "Create Article"

         expect(page).to have_content("New Title!")
         expect(page).to have_content("New Body!")
         expect(page).to have_content("Article New Title! Created!")
       end
     end
   end
 end
