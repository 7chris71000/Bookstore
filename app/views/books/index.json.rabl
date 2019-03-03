collection @books

attributes :id, :title, :created_at, :updated_at

child :user do 
	attributes :name
end