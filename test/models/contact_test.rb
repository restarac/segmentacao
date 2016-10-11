require 'test_helper'

class ContactTest < ActiveSupport::TestCase

    test 'Must validate the fill of ALL fields' do
        contact = Contact.create()
        assert contact.errors.size == 5

        contact = Contact.create(name: "Joao")
        assert contact.errors.size == 4

        contact = Contact.create(name: "Joao", occupation: "Operario")
        assert contact.errors.size == 3

        contact = Contact.create(name: "Joao", occupation: "Operario", age: 19)
        assert contact.errors.size == 2
    end

end
