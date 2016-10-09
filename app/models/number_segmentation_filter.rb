class NumberSegmentationFilter < SegmentationFilter

    def with field
        symbol = case name.lower
            when "igual a"
                "="
            when "menor que"
                "<"
            when "menor ou igual a"
                "<="
            when "maior que"
                ">"
            when "maior ou igual a"
                ">="
            else
                "="
        end
        "#{field} #{symbol} ?"
    end

end
