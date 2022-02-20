class InventoryManager
  attr_accessor :store, :model, :quantity

  def initialize(store, model, quantity)
    @store = store
    @model = model
    @quantity = quantity
  end

  def create_entry
    store = Store.find_by_name(@store)
    model = Model.find_by_name(@model)
    store = create_store(@store) if store.blank?
    model = create_model(@model) if model.blank?
    create_inventory_entry(store.id, model.id, @quantity)
  end

  private

  def create_model(str)
    Model.create!(name: str)
  end

  def create_store(str)
    Store.create!(name: str)
  end

  def create_inventory_entry(store_id, model_id, quantity)
    InventoryEntry.create!(store_id: store_id, model_id: model_id, quantity: quantity)
  end
end
