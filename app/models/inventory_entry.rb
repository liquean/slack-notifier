class InventoryEntry < ApplicationRecord
  belongs_to :store
  belongs_to :model

  validates_presence_of :quantity

  after_create :on_low_inventory

  private

  def on_low_inventory
    @slack_client ||= SlackService.new
    if quantity <= 5
      send_low_quantity_alarm
      send_stores_alarm
    end
  end

  def send_low_quantity_alarm
    @slack_client.low_quantity_alarm(store.name, model.name)
  end

  def send_stores_alarm
    stores = Store.joins(:inventory_entries).where('inventory_entries.quantity > ? and inventory_entries.model_id = ?', 5, model_id).limit(3).map(&:name)
    @slack_client.possible_stores(stores)
  end
end
