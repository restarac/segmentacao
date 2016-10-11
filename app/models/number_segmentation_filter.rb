class NumberSegmentationFilter < SegmentationFilter

    def mount_condition field
        symbol = case name
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
    
    def treat_value value
        value
    end

end
