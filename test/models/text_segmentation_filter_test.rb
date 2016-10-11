require 'test_helper'

class TextSegmentationFilterTest < ActiveSupport::TestCase

    test 'apply filter always the same' do
        where_filter = TextSegmentationFilter.new(name: 'contém').mount_condition 'email'
        assert_equal 'email like ?', where_filter

        where_filter = TextSegmentationFilter.new(name: 'igual a').mount_condition 'email'
        assert_equal 'email like ?', where_filter
    end

    test 'treat value IGUAL filter' do
        where_filter = TextSegmentationFilter.new(name: 'igual a').treat_value('gmail.com')
        assert_equal 'gmail.com', where_filter
    end

    test 'apply CONTEM filter' do
        where_filter = TextSegmentationFilter.new(name: 'contém').treat_value('gmail.com')
        assert_equal '%gmail.com%', where_filter
    end

    test 'apply TERMINA filter' do
        where_filter = TextSegmentationFilter.new(name: 'termina com').treat_value('gmail.com')
        assert_equal "%gmail.com", where_filter
    end

    test 'apply COMECA COM filter' do
        where_filter = TextSegmentationFilter.new(name: 'começa com').treat_value('gmail.com')
        assert_equal 'gmail.com%', where_filter
    end

    test 'apply unknown filter' do
        where_filter = TextSegmentationFilter.new(name: 'igual ou maior').treat_value('gmail.com')
        assert_equal 'gmail.com', where_filter, 'same as the igual'
    end
end
