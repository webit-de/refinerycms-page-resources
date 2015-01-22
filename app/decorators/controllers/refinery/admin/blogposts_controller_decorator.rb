if defined?(Refinery::Blog)
  Refinery::Blog::Admin::PostsController.class_eval do

    # work around an issue with stack level too deep, due to an issue with decorators.
    if self.instance_methods.exclude?(:post_params_with_page_resource_params)
      # We need to add :resources_attributes to post_params as it is ignored by strong parameters. (See #100)
      def post_params_with_page_resource_params

        # Get the :resources_attributes hash from params
        page_resource_params = params.require(:post).permit(resources_attributes: [:id, :caption])

        # If there is no :resources_attributes hash use a blank hash (so it removes deleted resources)
        page_resource_params = {resources_attributes:{}} if page_resource_params[:resources_attributes].nil?

        # Add the :resources_attributes hash to the default post_params hash
        post_params_without_page_resource_params.merge(page_resource_params)

      end

      # Swap out the default post_params method with our new one
      alias_method_chain :post_params, :page_resource_params
    end
  end
end