def calculate_prices(input_data)
 
    products = input_data[:products]
    tax = input_data[:tax]
    margin = input_data[:margin]
   
    total_price = 0
    calculated_products = []
  
    products.each do |product|
      net_cost = product[:net_cost]
      price_before_tax = net_cost + (net_cost * margin)
      price_with_tax = price_before_tax + (price_before_tax * tax)
      total_price += price_with_tax
  
      calculated_products << {
        "id": product[:id],
        "title": product[:title],
        "price": price_with_tax.round(2)
      }
    end
  
    output_data = {
      "products": calculated_products,
      "total_price": total_price.round(2)
    }
  
    return output_data
  end
  
 

  input_data = {
    "products": [
      {
        "id": 1,
        "title": "Product 1",
        "net_cost": 100
      },
      {
        "id": 2,
        "title": "Product 2",
        "net_cost": 200
      }
    ],
    "tax": 0.1,
    "margin": 0.2
  }
  

  output_data = calculate_prices(input_data)
  puts output_data
  