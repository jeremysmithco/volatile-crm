class TabsController < ApplicationController
  PAGES = (1..7).map(&:to_s).append("final").freeze

  def show
    @id = params[:id]
    @prev_id = prev_id
    @next_id = next_id
    render @id
  end

  private

  def next_id
    return unless current

    PAGES[(current + 1) % PAGES.length]
  end

  def prev_id
    return unless current

    PAGES[(current - 1) % PAGES.length]
  end

  def current
    PAGES.index(params[:id])
  end
end
