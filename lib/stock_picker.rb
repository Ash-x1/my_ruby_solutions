#!/usr/bin/env ruby

def stock_picker(prices)
  best_profit = 0
  best_days = []

  prices[0...-1].each_with_index do |buy_price, buy_day|
    prices[(buy_day + 1)..-1].each_with_index do |sell_price, index|
      sell_day = buy_day + 1 + index
      profit = sell_price - buy_price
      if profit > best_profit
        best_profit = profit
        best_days = [buy_day, sell_day, buy_price, sell_price]
      end
    end
  end

  best_days
end

stocks = [12, 5, 7, 3, 9, 14, 10, 4, 11, 2]
buy_day, sell_day, buy_price, sell_price = stock_picker(stocks)
puts "Bets day to buy #{buy_day} at $#{buy_price}"
puts "Best day to sell #{sell_day} at $#{sell_price}"
puts "Profit: $#{sell_price - buy_price}"

