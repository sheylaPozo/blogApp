module Api
  module V1
    class PostsController < ApplicationController
      load_and_authorize_resource

      def index
        @posts = Post.order(:created_at)
        render json: { success: true, message: 'All posts loaded', data: { posts: @posts } }
      end
    end
  end
end
