class InitialSchema < ActiveRecord::Migration
  def change

  	create_table	:renters do |t|
  		t.string	:fname
      t.string  :lname
      t.integer :id_no
      t.string  :license_no
  		t.text 		:description
  		t.string 	:city
      t.string  :state
  		t.string	:phone
  		t.string	:email
  	end

  	create_table 	:reviews do |t|
  		t.text	 	:comment
  		t.integer	:rating
  		t.integer	:years
  		t.text		:address1
  		t.text		:address2
  		t.text		:city
  		t.text		:state
  		t.text		:zipcode
  	end

  	create_table 	:property_types do |t|
  		t.string	:name
  	end

  end
end
