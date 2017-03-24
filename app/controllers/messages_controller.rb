class MessagesController < ApplicationController
  def create
    if current_user.is_manager && params[:message].present?
      @interview = Interview.find(params[:id])
      @student = @interview.user
      @message = Message.new(sender: current_user, receiver: @student, content: URI.unescape(params[:message]))
      @message.save!
    elsif !(current_user.is_manager) && params[:message].present?
      @admin_user = User.where({organisation_id: current_user.organisation_id, is_manager: true}).last
      @message = Message.new(sender: current_user, receiver: @admin_user , content: URI.unescape(params[:message]))
      @message.save!
    end
    skip_authorization
  end
end
