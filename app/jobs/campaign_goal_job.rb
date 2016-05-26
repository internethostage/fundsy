class CampaignGoalJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    campaign = args[0]
    pledges_amount = campaign.pledges.sum(:amount)
    if pledges_amount >= campaign.goal
      Rails.logger.info ">>>>>>>>> Campaign Funded"
    else
      Rails.logger.info ">>>>>>>>> Campaign Unfounded"
    end
  end
end
