def pet_shop_name(pet_shop)
  return pet_shop[:name]

end

def total_cash(pet_shop)
return pet_shop[:admin][:total_cash]

end


def add_or_remove_cash(pet_shop, cash)
  pet_shop[:admin][:total_cash] += cash

end

def pets_sold(pet_shop)
return pet_shop[:admin][:pets_sold]

end

def increase_pets_sold(pet_shop, sold)
return pet_shop[:admin][:pets_sold] += sold

end

def stock_count(pet_shop)
    total_stock = 0

    for pets in pet_shop
      total_stock += pets.count
    end

  return total_stock
end

def pets_by_breed(pet_shop, breed)
    pets_by_breed = []

    for pet in pet_shop[:pets]
      pets_by_breed << pet if pet[:breed]==breed
    end
return pets_by_breed

end

# # def find_pet_by_name(pet_shop, name)
# #     pet_by_name = [] #array not required as only 1 item is looked for.
# #     for pet in pet_shop[:pets]
# #       pet_by_name << pet if pet[:name]==name
# #     end
# # return pet_by_name
#
# end

def find_pet_by_name(pet_shop, name)
    pet_by_name = nil #this set the bucket as empty until the arguement
    #is returned as true.
    for pet in pet_shop[:pets]
      pet_by_name = pet if pet[:name]==name
    end
return pet_by_name

end


# def find_pet_by_name(pet_shop, name)
#   pet_by_name = [:pets][:name]
#   pet [:pets][:name].find(name)
#   pet [:pets][:name].length
# end

# def find_pet_by_name(pet_shop, name)
#   return name[:pet_shop][:pets]
#
# end


def remove_pet_by_name(pet_shop, pet_name)
  pet_to_delete = find_pet_by_name(pet_shop, pet_name)
  pet_shop[:pets].delete(pet_to_delete)
end

def add_pet_to_stock(pet_shop, pet)
  pet_shop[:pets].push(pet)
end

def customer_cash(customers)
return customers[:cash]

end

def remove_customer_cash(customers, cash)
  customers[:cash] -= cash

end

def customer_pet_count(customers)
  customers[:pets].count

end

def customer_pet_count(customers)
  customers[:pets].length

end



def add_pet_to_customer(customers, new_pet)
  customers[:pets]<< new_pet
  customers[:pets].count

end


def add_pet_to_customer(customers, new_pet)
  customers[:pets]<< new_pet
  customers[:pets].length

end

def customer_can_afford_pet(customer, pet)
  return customer[:cash] >= pet[:price]
end

def sell_pet_to_customer(pet_shop, pet, customer)
  return if (pet == nil)
  return if !(customer_can_afford_pet(customer, pet))

  add_pet_to_customer(customer,pet)
  add_or_remove_cash(pet_shop, pet[:price])
  remove_customer_cash(pet_shop, pet[:price])
  remove_pet_by_name(pet_shop, pet[:name])
  increase_pets_sold(pet_shop, 1)
end
