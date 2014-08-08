module DefaultResponses
  extend ActiveSupport::Concern

  def default_save_response(model)
    respond_to do |format|
      if model.save
        format.html { redirect_to model, notice: '%s was successfully created.' % model.class }
        format.json { render :show, status: :created, location: model }
      else
        format.html { render :new }
        format.json { render json: model.errors, status: :unprocessable_entity }
      end
    end
  end

  def default_update_response(model, params)
    respond_to do |format|
      if model.update(params)
        format.html { redirect_to model, notice: '%s was successfully updated.' % model.class }
        format.json { render :show, status: :ok, location: model }
      else
        format.html { render :edit }
        format.json { render json: model.errors, status: :unprocessable_entity }
      end
    end
  end

  def default_destroy_response(destination_url, success_msg)
    respond_to do |format|
      format.html { redirect_to destination_url, notice: success_msg }
      format.json { head :no_content }
    end
  end
end
