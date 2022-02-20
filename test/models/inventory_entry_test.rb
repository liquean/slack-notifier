require './test/test_helper'

class InventoryEntryTest < ActiveSupport::TestCase
  test 'InventoryEntry should not save without quantity' do
    inventory = InventoryEntry.new
    assert_not inventory.save, 'Saved the inventory without a quantity'
  end
end
