class SandboxController < ApplicationController
  def index
    @reports = Report.all.order('created_at DESC')
  end
end
