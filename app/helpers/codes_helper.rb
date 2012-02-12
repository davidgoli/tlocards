module CodesHelper
  def paginate_codes codes, &block
    to_paginate = codes.dup
    while to_paginate.length > 0
      yield to_paginate.shift(8)
    end
  end

  def redeemed_codes codes, &block
    codes.where(:redeemed => 1).each do |code|
      yield code
    end
  end
end
