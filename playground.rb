transactions = Transaction.all
users = User.all

for transaction in transactions 
amount = transaction["amount"] 
from_user_id = transaction["from_user_id"]
to_user_id = transaction["to_user_id"]
from_user = User.find_by("id" => from_user_id)
to_user = User.find_by("id" => to_user_id)["name"]

from_user_name = case from_user
when nil then "Initial Coin Offering"
else from_user["name"]
end

puts "#{amount} from #{from_user_name} to #{to_user}"

end