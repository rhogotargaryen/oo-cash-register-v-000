class CashRegister
  attr_accessor :total, :discount, :items

  def initialize(disc = 0)
    @total = 0
    @discount = disc
    @items = []
  end
  def add_item(title, price, quant = 1)
    while quant > 0
      @items << { title => price }
      quant -= 1
    end
    self.tote
  end
  def tote
    @total = 0
    @items.each do |obj|
      obj.each do |item, price|
        @total += price
      end
    end
    @total
  end
  def apply_discount
    if @discount != 0
      @total = self.total
      price_off = @total * @discount.to_f/100
      @total -= price_off
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      return "There is no discount to apply."
    end
  end
  def items
    item_array = []
    @items.each do |obj|
      obj.each do |item, value|
        item_array << item
      end
    end
    item_array
  end
  def void_last_transaction
    void_item = @items.pop
    void = void_item.values
    @total -= void[0]
  end
end
