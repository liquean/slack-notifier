class SlackService
  def low_quantity_alarm(store_name, model_name)
    str = "Be careful, the store #{store_name} has less than 5 #{model_name} elements in stock"
    send_notification(str)
  end

  def possible_stores(store_names)
    str = "The following stores can help with the low inventory #{store_names.join(' , ')}"
    send_notification(str)
  end

  private

  def send_notification(text)
    HTTParty.post('https://hooks.slack.com/services/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',
                  body: { text: text }.to_json,
                  headers: { 'Content-Type' => 'application/json' })
  end
end
