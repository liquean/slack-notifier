require './test/test_helper'

class StoreTest < ActiveSupport::TestCase
  test 'Store should not save without name' do
    store = Store.new
    assert_not store.save, 'Saved the store without a name'
  end

  test 'Store should not save with repeated name' do
    store1 = Store.create!({ name: 'Store' })
    store2 = Store.new({ name: 'Store' })
    assert_not store2.save, 'Saved the store with repeated name'
  end
end
