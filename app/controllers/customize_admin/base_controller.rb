module CustomizeAdmin
  class BaseController < ApplicationController
    inherit_resources
    helper_method :sort_column, :sort_direction, :string_filter
    before_filter :authenticate_admin_user!
    SEARCH_QUERY = "name LIKE ?"
   # defaults :route_prefix => 'admin'

    protected
    def collection
       collection = search(params[:search]).order( sort_column + " " + sort_direction ).paginate(:per_page => 10, :page => params[:page])
    end

    def sort_column
      sort_params = params[:sort].to_s.downcase
      end_of_association_chain.column_names.include?(sort_params) ? sort_params : "id"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    def string_filter
      t=[]
      end_of_association_chain.columns.each do |m|
        m.type == :string ? t << m.name : ""
      end
      t
    end

    def search( s )

      if s
        end_of_association_chain.where( "#{SEARCH_QUERY} ", "%#{s}%" )
      else
        end_of_association_chain
      end
    end

  end
end
