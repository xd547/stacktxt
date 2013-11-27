require "core/share_actions"

class StackController < ApplicationController
  def index
    if request.method == 'POST'
      share_key = Core::ShareActions.save(get_content)
      respond_to do |format|
        format.html { redirect_to share_path(share_key) }
        format.json { 
          @share_obj = Core::ShareActions.get(share_key)
          if Core::ShareActions.verify(@share_obj)
            render json: @share_obj
          else
            render json: { content: "error", status: :unprocessable_entity }
          end
        }
      end
    end
  end

  def show
    share_key = params[:share_key]
    @share_obj = Core::ShareActions.get(share_key)
  
    if Core::ShareActions.verify(@share_obj)
      @content = @share_obj[:content]
    else
      redirect_to root_path
    end
  end

  private
    def get_content
      params.require(:share).permit(:content)[:content]
    end
end
