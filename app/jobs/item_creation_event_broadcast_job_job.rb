class ItemCreationEventBroadcastJobJob < ApplicationJob
  queue_as :default

  def perform(item)
    # Do something later
    ActionCable.server.broadcast('items_channel', {
      description: render_description(item)
    })
  end
  
  private

  def render_description(item)
    # In Rails 5, renderer has been made public so that we can use
    # ApplicationController.renderer to render a partial
    ApplicationController.renderer.render(
      partial: 'articles/item', locals: { item: item })
  end
end
