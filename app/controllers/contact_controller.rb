class ContactController < ApplicationController
  def index
    @contact = Contact.new
    @type_contact = [['Crítica', 1], ['Defeito/problema', 0]]
  end
end
