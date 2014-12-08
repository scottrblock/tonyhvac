class PagesController < ApplicationController
  def home

  end

  def customer_home
    @active_jobs = current_customer.jobs.where("contractor_id IS NOT NULL").order("updated_at desc")
    @pending_jobs = current_customer.jobs.where(:contractor_id => nil).order("updated_at desc")
    @completed_jobs = current_customer.jobs.where('"jobEndDate" IS NOT NULL').order("updated_at desc")
  end

  def contractor_home
  end

  def set_availability
  end

  def show_contractors
  end

  def update_resource
  end

  def jobs_sorted_by_date
  end


end