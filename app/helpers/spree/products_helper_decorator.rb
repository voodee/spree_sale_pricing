def discount_percentage(product)
  if product.master.msrp.present? && (product.master.msrp.to_f > 0)
    "#{((1 - product.price.to_f / product.master.msrp.to_f) * 100).round}"
  else
    return '0'
  end
end

def discount_percentage_variant(variant)
  if variant.msrp.present? && (variant.msrp.to_f > 0)
    # this check is because of a oddity in our elasticsearch gem. we should fix it
    # We also check if it is an instance of Float becuase spree-product-assemblies is somehow returning a Float
    "#{((1 - ((variant.price.instance_of?(BigDecimal) || variant.price.instance_of?(Float)) ? variant.price.to_f : variant.price.amount.to_f) / variant.msrp.to_f) * 100).round}"
  else
    return '0'
  end
end
