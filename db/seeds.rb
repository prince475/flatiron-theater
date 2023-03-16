# frozen_string_literal: true

CrewMember.destroy_all

Production.destroy_all

Production.create(title: 'Carmen', genre:'Opera', budget: 80000.00, image:'')
Production.create(title: 'Cats', genre:'Musical', budget: 50000.00, image:'')
Production.create(title: 'Hamilton', genre:'Musical', budget: 100000.00, image:'')
Production.create(title: 'Hamlet', genre:'Shakespearean', budget: 70000.00, image:'')


10.times do

  CrewMember.create(
  [
    {
      name: Faker::Name.name,
      job_title: %w[StageHand Producer Director Stand].sample,
      salary: [70000.00, 65000.00, 90000.00, 45000.00].sample,
      production: Production.all.sample
    }
  ]
)
end
