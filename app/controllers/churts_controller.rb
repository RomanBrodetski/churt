class ChurtsController < ApplicationController
  unloadable

    # closed_ids = IssueStatus.where(:is_closed => true).map &:id
  Closed_ids = [3, 5] #todo: get this info from plugin settings
  Step = 1.day #todo: get this info from plugin settings

  def index
    @project = Project.find(params[:project_id])
    @issues = @project.issues

    @data = @project.created_on.to_i.step(Time.now.to_i, Step).map do |time|
      [Time.at(time)] + @issues.where("created_on < ?", Time.at(time)).partition {|issue| Closed_ids.include? issue.status_on(Time.at(time))}.map(&:length)
    end.to_json
  end

end
