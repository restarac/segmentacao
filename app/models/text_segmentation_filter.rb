class TextSegmentationFilter < SegmentationFilter

    def with field
        symbol = case name
            when "igual a"
                "?"
            when "contém"
                "%?%"
            when "começa com"
                "?%"
            when "termina com"
                "%?"
            else
                "?"
        end
        "#{field} like '#{symbol}'"
    end

end