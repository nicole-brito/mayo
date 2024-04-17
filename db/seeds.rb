200.times do |i|
  Article.create(
    title: FFaker::LoremBR.sentence,
    body: FFaker::LoremBR.paragraphs.join("\n"),
    user_id: 1
  )
end