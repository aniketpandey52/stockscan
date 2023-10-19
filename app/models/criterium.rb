class Criterium < ApplicationRecord
    belongs_to :scan, foreign_key: 'url', primary_key: 'url'
    has_many :variables

    def as_json(options={})
        result = super(options.merge({only: [:text, :category]}))
        result["type"] = result["category"]
        result.delete "category"
        result
    end
end
