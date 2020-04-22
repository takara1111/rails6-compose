class Admin::StaffEventsController < Admin::Base
  def index
    if params[:staff_member_id]
      @staff_member = StaffMember.find(params[:staff_member_id])
      @events = @staff_member
    else
      @events = StaffEvent
    end
    @events = @events.order(occrrd_at: :desc)
    @events = @events.include(:member)
    @events = @events.page(params[:page])
  end
end