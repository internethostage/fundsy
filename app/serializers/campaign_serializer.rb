class CampaignSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :url, :created_at, :end_date

  include ApplicationHelper

  has_many :pledges

  def title
    object.title.titleize
  end

  def url
    campaign_url(object, host: "http://localhost:3000")
  end

  def created_at
    formatted_date(object.created_at)
  end

  def end_date
    formatted_date(object.end_date)
  end

end
