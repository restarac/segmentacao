require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact = contacts(:one)
  end

  test "should get index" do
    get contacts_url
    assert_response :success
  end

  test "should get new" do
    get new_contact_url
    assert_response :success
  end

  test "should create contact" do
    assert_difference('Contact.count') do
      post contacts_url, params: { contact: { age: @contact.age, email: @contact.email, name: @contact.name, occupation: @contact.occupation, state_id: @contact.state_id } }
    end

    assert_redirected_to contact_url(Contact.last)
  end

  test "should NOT show contact" do
    begin 
      get contact_url(@contact)
    rescue ActionController::RoutingError => error
      assert error.message.start_with? "No route matches"
    end
  end

  test "should get edit" do
    get edit_contact_url(@contact)
    assert_response :success
  end

  test "should update contact" do
    patch contact_url(@contact), params: { contact: { age: @contact.age, email: @contact.email, name: @contact.name, occupation: @contact.occupation, state_id: @contact.state_id } }
    assert_redirected_to contact_url(@contact)
  end

  test "should update and NEW anothercontact" do
    patch contact_url(@contact), params: { contact: { age: @contact.age, email: @contact.email, name: @contact.name, occupation: @contact.occupation, state_id: @contact.state_id }, save_and_add: 'save_and_add' }
    assert_redirected_to(controller: "contacts", action: "new")
  end

  test "should destroy contact" do
    assert_difference('Contact.count', -1) do
      delete contact_url(@contact)
    end
    assert_redirected_to contacts_url
  end
end
