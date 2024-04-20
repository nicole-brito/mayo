200.times do |i|
  Article.create(
    title: FFaker::LoremBR.sentence,
    body: FFaker::LoremBR.paragraphs.join("\n"),
    user_id: 1
  )
end

User.create(
  first_name: "Inactive",
  last_name: "User",
  email: "inactive@user.com",
  password: "inactiveuser"
)
