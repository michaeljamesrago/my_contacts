Category.create(name: "family")
Category.create(name: "work")
Category.create(name: "school")
Category.create(name: "basketball")
Category.create(name: "friends")

32.times do |n|
  name = Faker::Name.name
  email = ""
  8.times{email << (65 + rand(25)).chr}
  email += "@struzfoinkwah.com"
  phone = "(123)456-7890"
  Contact.create(
    name: name,
    email: email,
    phone: phone
  )
end

num = 2
Category.all.each do |category|
  Contact.all.each_with_index do | contact, i |
    if (i + 1) % num == 0
      category.add(contact)
    end
  end
  num += 2
end

