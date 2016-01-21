class Product < ActiveRecord::Base

  def sale_message
    if price.to_i < 2
      "Discount item!"
    else 
      "On Sale!"
    end 
  end

  def cost
    '%.2f' % price
  end

  def sale_tax
    @tax = price * 0.09
    "#{@tax}"
  end

  def total_cost
    @total = price + @tax
    "#{@total}"
  end

  def in_stock?
    if inventory == 0 || inventory == nil
      "Out of stock."
    else
      "In Stock."
    end
  end

  def stock_class
    if inventory == 0 || inventory == nil
      "out_of_stock"
    else
      "in_stock"
    end
  end

end
