
require './contact.rb'

class CRM

  def main_menu
    while true
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit

    end
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    contact = Contact.create(
      first_name: first_name,
      last_name:  last_name,
      email:      email,
      note:       note
    )
  end

  def modify_existing_contact
    id = get_id
    puts "#{Contact.find(id).first_name} #{Contact.find(id).last_name} | #{Contact.find(id).email} | #{Contact.find(id).note}"
    print_modify_menu
    user_selected = gets.to_i
    call_modify_option(user_selected, id)
    puts "#{Contact.find(id).first_name} #{Contact.find(id).last_name} | #{Contact.find(id).email} | #{Contact.find(id).note}"
  end

  def delete_contact
    id = get_id
    contact = Contact.find(id)
    contact.delete
    puts "#{contact.first_name} #{contact.last_name} deleted."
  end

  def display_all_contacts
    puts "Contacts:"
    puts Contact.contacts
  end

  def search_by_attribute
    print_by_option_menu
    user_selected = gets.to_i
    call_search_by_option(user_selected)
  end

end

at_exit do
  ActiveRecord::Base.connection.close
end







# Old Code:
# require "./contact.rb"
#
# class CRM
#
#   # def initialize not used.
#
#   def main_menu
#     while true # repeat indefinitely
#       print_main_menu
#       user_selected = gets.to_i
#       call_option(user_selected)
#     end
#   end
#   def print_main_menu
#     puts '[1] Add a new contact'
#     puts '[2] Modify an existing contact'
#     puts '[3] Delete a contact'
#     puts '[4] Display all the contacts'
#     puts '[5] Search by attribute'
#     puts '[6] Exit'
#     puts 'Enter a number: '
#     print "> "
#   end
#
#   def call_option(user_selected)
#     case user_selected
#     when 1 then add_new_contact
#     when 2 then modify_existing_contact
#     # Finish off the rest for 3 through 6
#     # To be clear, the methods add_new_contact and modify_existing_contact
#     # haven't been implemented yet
#     end
#   end
#
#   def add_new_contact
#     puts "Enter a first name:"
#     print "> "
#     first_name = gets.chomp
#     puts "Enter a last name:"
#     print "> "
#     last_name = gets.chomp
#     puts "Enter a note for this contact:"
#     print "> "
#     note = gets.chomp
#     puts "Enter an email address:"
#     print "> "
#     email = gets.chomp
#     contact = contact = Contact.create(
#   first_name: first_name,
#   last_name:  last_name,
#   email:      email,
#   note:       note
# )
#     return contact
#   end
#
#   def modify_existing_contact
#     id = get_id
#     puts "#{Contact.find(id).first_name} #{Contact.find(id).last_name} | #{Contact.find(id).email} | #{Contact.find(id).note}"
#     print_modify_menu
#     user_selected = gets.to_i
#     call_modify_option(user_selected, id)
#     puts "#{Contact.find(id).first_name} #{Contact.find(id).last_name}| #{Contact.find(id).email}| #{Contact.find(id).note}"
#   end
#
#   def delete_contact
#     id = get_id
#     contact = Contact.find(id)
#     contact.delete
#     puts "#{contact.first_name} #{contact.last_name} deleted."
#   end
#
#   def display_all_contacts
#     puts "Contact List:"
#     puts Contact.contacts
#   end
#
#   def search_by_attribute
#
#   end
# end
#
# a_crm_app = CRM.new
# a_crm_app.main_menu
