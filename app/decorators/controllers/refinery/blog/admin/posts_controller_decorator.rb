if defined?(Refinery::Blog)
  Refinery::Blog::Admin::PostsController.prepend(
    Module.new do
      def permitted_post_params
        params[:post][:resources_attributes]={} if params[:post][:resources_attributes].nil?
        super <<  [resources_attributes: [:id, :caption, :page_resource_id]]
      end
    end
  )
end
