class TagsController < ApplicationController
    include TagsHelper
    before_filter :require_login, only: [:destroy, :edit]
    
    def index
        @tag = Tag.all
    end

    def show
        @tag = Tag.find(params[:id])
    end
    
    def edit
        @tag = Tag.find(params[:id])
    end
    
    def update
        @tag = Tag.find(params[:id])
        @tag.update(tag_params)
        
        flash.notice = "Article '#{@tag.name}' Updated!"
        
        redirect_to action: "index"
    end
    
    def destroy
        @tag = Tag.find(params[:id])
        @tag.destroy
        
        flash.notice = "Article '#{@tag.name}' Deleted!"
        
        redirect_to action: "index"
    end
end
