class TextSegmentationFilter < SegmentationFilter

    def mount_condition field
        "#{field} like ?"
    end

    def treat_value value
        symbol = case name
            when 'igual a'
                '?'
            when 'contém'
                '%?%'
            when 'começa com'
                '?%'
            when 'termina com'
                '%?'
            else
                '?'
        end
        symbol.gsub!('?', value)
    end
end