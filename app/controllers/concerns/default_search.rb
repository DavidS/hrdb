# everything concerning the scoped_search implementation
module DefaultSearch
  def default_index(klass, params)
    klass.search_for(params[:search], order: params[:order])
  rescue => e
    flash[:error] = e.to_s
    klass.search_for ''
  end

  def auto_complete_search_impl(klass, search_params)
    begin
      @items = klass.complete_for(search_params)
    rescue ScopedSearch::QueryNotSupported => e
      @items = [{ error: e.to_s }]
    end
    render json: @items
  end
end
