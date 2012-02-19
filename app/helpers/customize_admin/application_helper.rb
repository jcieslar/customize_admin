module CustomizeAdmin
  module ApplicationHelper
    def sortable( column, title = nil )
      title ||= column.titleize
      column = column.to_s.downcase
      direction = ( column == sort_column && sort_direction == "asc" ) ? "desc" : "asc"
      link_to title, { :sort => column, :direction => direction }
    end

    def test
      string_filter.each do |n|

      end
    end
    def attributes
      resource_class.attribute_names - %w(created_at updated_at)
    end

  end
end
