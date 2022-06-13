Rails.logger = Logger.new(STDOUT)
FactoryBot.create(:section, day: 1, start_time_human: '11:00AM')
FactoryBot.create(:section, day: 2, start_time_human: '12:00AM')
FactoryBot.create(:section, day: 2, start_time_human: '12:30AM')
