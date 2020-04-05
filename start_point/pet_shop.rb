def pet_shop_name(pet_shop)
    return pet_shop[:name]
end

def total_cash(pet_shop)
    return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop,amount_of_cash_to_add_or_remove)
    pet_shop[:admin][:total_cash] += amount_of_cash_to_add_or_remove
end

def pets_sold(pet_shop)
    return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, amount_sold)
    pet_shop[:admin][:pets_sold] += amount_sold
end

def stock_count(pet_shop)
    return pet_shop[:pets].length()
end

def pets_by_breed(pet_shop, check_breed)
    pets_found = []
    for pet in pet_shop[:pets]
        if pet[:breed] == check_breed
            pets_found.push(pet)
        end
    end
    return pets_found
end

def find_pet_by_name(pet_shop, pet_name)
    pets_found_hash= nil
    for pet_found in pet_shop[:pets] 
        if pet_found[:name] == pet_name
            pets_found_hash = pet_found
        end
    end
    return pets_found_hash
end

def remove_pet_by_name(pet_shop, pet_name_to_remove)
   for pet_found in pet_shop[:pets]
        if pet_found[:name] == pet_name_to_remove
            pet_shop[:pets].delete(pet_found)
        end
    end
end

def add_pet_to_stock(pet_shop, new_pet)
    pet_shop[:pets].push(new_pet)
end

def customer_cash(customers)
    return customers[:cash]
end

def remove_customer_cash(customer, amount_to_remove)
    customer[:cash] -= amount_to_remove
end

def customer_pet_count(customers)
    return customers[:pets].count()
end

def add_pet_to_customer(customer, new_pet)
    customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, new_pet)
    # if customer[:cash] > new_pet[:price]
    #     return true
    # elsif customer[:cash] < new_pet[:price]
    #     return false
    # elsif customer[:cash] == new_pet[:price]
    #     return true
    # end

    if customer[:cash] >= new_pet[:price]
        return true
    else 
        return false
    end

end

# First version of function. Works for test starting on line 198 of pet_shop_spec
def sell_pet_to_customer(pet_shop, pet, customer)
    
    remove_pet_by_name(pet_shop, pet[:name])
    remove_customer_cash(customer, pet[:price])
    add_pet_to_customer(customer, pet)
    increase_pets_sold(pet_shop, 1)
    pet_shop[:admin][:total_cash] += pet[:price]

end

