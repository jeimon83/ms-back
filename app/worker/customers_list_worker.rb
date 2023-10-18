class CustomersListWorker
  include Sidekiq::Worker

  def perform
    return true unless first_or_third_monday?

    CustomersMailer.send_list.deliver_now
  end

  private

  def first_or_third_monday?
    today = Date.current
    return true if (today.monday? && today.day <= 7) || (today.monday? && today.day >= 15 && today.day <= 21)

    false
  end
end
