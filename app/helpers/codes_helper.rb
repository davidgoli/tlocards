module CodesHelper
  PAGE_SIZE = 8
  def paginate_codes codes, &block
    to_paginate = codes.dup
    while to_paginate.length > 0
      yield to_paginate.shift(PAGE_SIZE)
    end
  end
end
