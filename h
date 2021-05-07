
[1mFrom:[0m /home/vagrant/workspace/s2/naganocake/app/controllers/public/cart_items_controller.rb:31 Public::CartItemsController#create:

    [1;34m27[0m: [32mdef[0m [1;34mcreate[0m
    [1;34m28[0m:   @cart_item = [1;34;4mCartItem[0m.new(cart_item_params)
    [1;34m29[0m:   @cart_items = current_end_user.cart_items
    [1;34m30[0m:   binding.pry
 => [1;34m31[0m:   @cart_items.each [32mdo[0m |cart_item|
    [1;34m32[0m:     [32mif[0m cart_item.item_id == @cart_item.item_id
    [1;34m33[0m:       new_amt = cart_item.amount + @cart_item.amount
    [1;34m34[0m:       cart_item.update([33m:amount[0m, new_amt)
    [1;34m35[0m:     [32melsif[0m
    [1;34m36[0m:       @cart_item.end_user_id = current_end_user.id
    [1;34m37[0m:       @cart_item.save
    [1;34m38[0m:       redirect_to cart_items_path
    [1;34m39[0m:     [32melse[0m
    [1;34m40[0m:       render [31m[1;31m'[0m[31mpublic/items/show[1;31m'[0m[31m[0m
    [1;34m41[0m:     [32mend[0m
    [1;34m42[0m:   [32mend[0m
    [1;34m43[0m: [32mend[0m

