class Item < ApplicationRecord
  after_create_commit do
    ItemCreationEventBroadcastJobJob.perform_later(self)
  end
end