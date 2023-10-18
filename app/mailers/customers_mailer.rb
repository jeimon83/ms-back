class CustomersMailer < ApplicationMailer
  def send_list
    recipients = ['jaime@mundosatelital.com.ar']
    @customers = Customer.all

    mail(to: recipients, subject: 'Listado de clientes')
  end
end
