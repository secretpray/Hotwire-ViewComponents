return unless Rails.env == 'development'

Message.destroy_all

20.times do 
  Message.create!(body: Faker::Books::Dune.quote)
end

puts "Created #{Message.count} messages."