every :monday, at: '3:00am' do
  runner "CustomersListEmailSender.perform_async"
end