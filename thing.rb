class Contact

   # This method should initialize the contact's attributes
   def initialize
   @@contacts = []
   @@id = 1

   def initialize(first_name, last_name, email, note)
       @first_name = first_name
       @last_name = last_name
       @email = email
       @note = note
       @id = @@id
       @@id += 1
   end

   def email
     @email
   end

   # This method should call the initializer,
   # store the newly created contact, and then return it
   def self.create
   def email=(k)
     @email = k
   end

   def note
     @note
   end

   def note=(note)
     @note = note
   end

   def id
     @id
   end

 def first_name
   @first_name
 end

 def first_name=(var)
   @first_name = var
 end

 def last_name
   @last_name
 end

 def last_name=(nope)
   @last_name = nope
 end

   # This method should call the initializer,
   # store the newly created contact, and then return it
   def self.create(first_name, last_name, email, note)
     new_contact = Contact.new(first_name, last_name, email, note)
       @@contacts << new_contact
       return new_contact
   end

   # This method should return all of the existing contacts
   def self.all

     @@contacts
   end

   # This method should accept an id as an argument
   # and return the contact who has that id
   def self.find

   def self.find (id)
     @@contacts.each do |contact|
       if contact.id == id
         return contact
       end
     end
   end

   # This method should allow you to specify
   # This method should allow you to specify
   # 1. which of the contact's attributes you want to update
   # 2. the new value for that attribute
   # and then make the appropriate change to the contact
   def update

   def update(attribute, value)
     if attribute == "last_name"
       self.last_name = value
     elsif attribute == "first_name"
       self.first_name = value
     elsif attribute == "email"
       self.email = value
     elsif attribute == "note"
       self.note = value
     end
   end

   # This method should work similarly to the find method above
   # but it should allow you to search for a contact using attributes other than id
   # by specifying both the name of the attribute and the value
   # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
   def self.find_by

   def self.find_by (first_name)
     @@contacts.each do |contact|
       if contact.first_name == first_name
         return contact
       end
     end
   end


   # This method should delete all of the contacts
   def self.delete_all

     @@contacts=[]
     @@id=1
   end

   def full_name

     "#{ first_name } #{ last_name }"
   end

   # This method should delete the contact
   # HINT: Check the Array class docs for built-in methods that might be useful here
   def delete

     @@contacts.delete( self)
   end

   # Feel free to add other methods here, if you need them.


 end

  betty = Contact.create('Betty', 'Maker', 'bettymakes@gmail.com', 'Loves Pokemon')
  tom = Contact.create('Tom', 'Maker', 'tommakes@gmail.com', 'N/A')
  puts betty.email # => 'bettymakes@gmail.com'
  puts betty.note = 'Loves HTML & CSS'
  p Contact.find(1)
  puts "_____"
  p Contact.find_by("Betty")
  puts betty.full_name
  puts tom.update("last_name","Tomm")
