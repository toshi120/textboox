FactoryBot.define do
  factory :progress do
    progress_page       { 300 }
    comment             { '◯◯と◯◯がよくわからなかったから次回詳しく教えて欲しい' }
    association :students_textbook
  end
end
