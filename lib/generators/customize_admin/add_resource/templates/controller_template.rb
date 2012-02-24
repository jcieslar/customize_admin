class <%=@namespace_class%>::<%=@controller_name%>Controller < CustomizeAdmin::BaseController
  defaults :resource_class => <%= @resource %>, :collection_name => "<%=@collection_name %>", :instance_name => "<%= @instance_name %>"
end
