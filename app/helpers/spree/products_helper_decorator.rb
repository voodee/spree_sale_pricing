def discount_percentage(product)
  if product.master.msrp.present? && (product.master.msrp.to_f > product.price.to_f)
    "#{((1 - product.price.to_f / product.master.msrp.to_f) * 100).round}"
  else
    return '0'
  end
end

def discount_percentage_variant(variant)
  price = variant.price.respond_to?(:to_f) ? variant.price.to_f : variant.price.amount.to_f
  msrp = variant.msrp.try(:to_f)

  if msrp && variant.price && (msrp > price)
    "#{((1 - price / msrp) * 100).round}"
  else
    return '0'
  end
end
