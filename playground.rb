transactions = Transaction.all
users = User.all

for transaction in transactions 
  amount = transaction["amount"] 
  from_user_id = transaction["from_user_id"]
  to_user_id = transaction["to_user_id"]
  from_user = users.find_by("id" => from_user_id)
  to_user = users.find_by("id" => to_user_id)["name"]
  
  from_user_name = case from_user
  when nil then "Initial Coin Offering"
  else from_user["name"]
  end

puts "#{amount} from #{from_user_name} to #{to_user}"

end

for user in users
  name = user["name"]
  id = user["id"]
  received = Transaction.where({ "to_user_id" => id }).sum("amount")
  sent = Transaction.where({ "from_user_id" => id }).sum("amount")
  total = received - sent
  puts "Balance for #{name} is #{total}KC"
end
