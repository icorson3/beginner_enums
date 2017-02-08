require 'minitest/autorun'
require 'minitest/pride'
require './lib/dealer'
require './lib/car'

class DealerTest < Minitest::Test
attr_reader :dealer, :navy_bean, :red_panther, :green_dragon, :pink_butterfly
  def setup
    @dealer = Dealer.new
    @navy_bean = Car.new(2010, "Nissan")
    @red_panther = Car.new(1983, "Jaguar")
    @green_dragon = Car.new(1999, "Honda")
    @pink_butterfly = Car.new(2000, "Nissan")


    dealer.add_inventory(navy_bean)
    dealer.add_inventory(red_panther)
    dealer.add_inventory(green_dragon)
    dealer.add_inventory(pink_butterfly)

  end

  def test_dealer_class_exists
    assert_equal Dealer, dealer.class
  end

  def test_dealer_has_empty_inventory_to_begin
    assert_equal [navy_bean, red_panther, green_dragon, pink_butterfly], dealer.inventory
  end

  def test_dealer_can_add_cars_to_inventory
    assert_equal 4, dealer.inventory.count
  end

  def test_dealer_can_return_all_cars_by_make_only
    assert_equal ["Nissan", "Jaguar", "Honda", "Nissan"], dealer.all_makes
  end

  def test_dealer_can_return_all_cars_by_year_only
    assert_equal [2010, 1983, 1999, 2000], dealer.all_years
  end

  def test_can_find_the_first_of_a_make
    assert_equal navy_bean, dealer.find_first("Nissan")
  end

  def test_can_find_all_of_a_make
    assert_equal [navy_bean, pink_butterfly], dealer.find_many("Nissan")
  end

  def test_can_order_year_oldest_to_youngest
    assert_equal [1983, 1999, 2000, 2010], dealer.youngest_to_oldest_years
  end

  def test_can_find_first_year_chronologically
    assert_equal 1983, dealer.find_first_year_chronologically
  end

  def test_can_order_by_year
    skip
    assert_equal [red_panther, green_dragon, pink_butterfly, navy_bean], dealer.order_model_by_year
  end

  def test_can_find_youngest_model
    skip
    assert_equal navy_bean, dealer.youngest_model
  end

  def test_can_find_oldest_model
    skip
    assert_equal red_panther, dealer.oldest_model
  end

  def test_all_models_are_from_the_year_1983
    skip
    assert_equal false, dealer.made_in_the_year(1983)
  end

  def test_are_any_hondas
    skip
    assert_equal true, dealer.any_of_this_make("Honda")
  end
end
