require './test/test_helper'

class ModelTest < ActiveSupport::TestCase
  test 'Model should not save without name' do
    model = Model.new
    assert_not model.save, 'Saved the model without a name'
  end
 
  test 'Model should not save with repeated name' do
    model1 = Model.create!({ name: 'Model' })
    model2 = Model.new({ name: 'Model' })
    assert_not model2.save, 'Saved the model with repeated name'
  end
end
