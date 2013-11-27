require "core/share_actions"

class StackController < ApplicationController
  def index
    if request.method == 'POST'
      share_key = Core::ShareActions.save(get_content)
      redirect_to share_path(share_key)
    end
  end

  def show
    share_key = params[:share_key]
    @share_obj = Core::ShareActions.get(share_key)
  
    respond_to do |format|
      if Core::ShareActions.verify(@share_obj)
        @content = @share_obj[:content]
        format.html
        format.json { render json: @share_obj }
      else
        format.html { redirect_to root_path }
        format.json { render json: { content: "error", status: :unprocessable_entity } }
      end
    end
  end

  private
    def get_content
      params.require(:share).permit(:content)[:content]
    end
end
