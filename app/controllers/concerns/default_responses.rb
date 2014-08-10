# a collection of default responses to reduce clutter in the controllers
module DefaultResponses
  extend ActiveSupport::Concern

  def redirect_or_render_on_action(model, success_message, error_view)
    respond_to do |format|
      if yield
        format.html { redirect_to model, notice: success_message }
        format.json { render :show, status: :created, location: model }
      else
        format.html { render error_view }
        format.json { render json: model.errors, status: :unprocessable_entity }
      end
    end
  end

  def default_save_response(model)
    msg = format('%s was successfully created.', model.class)
    redirect_or_render_on_action(model, msg, :new) { model.save }
  end

  def default_update_response(model, params)
    msg = format('%s was successfully updated.', model.class)
    redirect_or_render_on_action(model, msg, :edit) { model.update(params) }
  end

  def default_destroy_response(destination_url, success_msg)
    respond_to do |format|
      format.html { redirect_to destination_url, notice: success_msg }
      format.json { head :no_content }
    end
  end
end
