function Div (div)
    if div.classes:includes 'columns' then
      local columns = div.content
        :filter(function (x)
          return x.classes and x.classes[1] == 'column'
        end)
        :map(function (x)
          return x.content
        end)
      local aligns = {}
      local widths = {}
      local headers = {}
      for i, k in ipairs(columns) do
        aligns[i] = 'AlignDefault'
        widths[i] = 0.98/ #columns
      end
      return pandoc.utils.from_simple_table(
        pandoc.SimpleTable('', aligns, widths, headers, {columns})
      )
    end
  end