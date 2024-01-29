class Album < ApplicationRecord
    self.primary_key = "AlbumId"
    belongs_to :artist, foreign_key: 'ArtistId', primary_key: 'ArtistId'
    # paginates_per 25
end
