class Artist < ApplicationRecord
    self.primary_key = "ArtistId"
    has_many :album
end
