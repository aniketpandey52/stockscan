class Variable < ApplicationRecord
  belongs_to :criterium

  def as_json(options={})
    result = super(options.merge({only: [:properties, :category, :url, :identifier]}))
    result["type"] = result["category"]
    result["properties"] = JSON.parse(result["properties"])
    result.delete "category"
    result
  end
end
