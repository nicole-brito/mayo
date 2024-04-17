200.times do |i|
  Article.create(
    title: FFaker::LoremBR.sentence,
    body: FFaker::LoremBR.paragraphs.join("\n"),
    status: "public"
  )
end