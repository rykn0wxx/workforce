class SandboxController < ApplicationController
  def index
    @reports = Report.all.order('created_at DESC')
  end
  def showy
    @fact = PhoneFact.paginate(:per_page => 10, :page => params[:page])
  end
  def icony
    @icons = Icon.all
    @icons.map do |icon, k|
      {
        name: icon.name,
        val: 1
      }
    end
  end
end
