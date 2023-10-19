class Scan < ApplicationRecord
    has_many :criteria, foreign_key: 'url', primary_key: 'url'

    def as_json(options={})
        result = super(options.merge({only: ["id", "name", "color", "tag", "url"]}))
        result
    end
end
