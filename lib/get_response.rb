require "rubygems"
require 'json'

module GetResponse

  # Operators that may be used in queries to GetResponse API service
  OPERATORS = {
    "is_eq"       => "EQUALS",
    "is_not_eq"   => "NOT_EQUALS",
    "contain"     => "CONTAINS",
    "not_contain" => "NOT_CONTAINS",
    "match"       => "MATCHES"
  }

end


class SymbolOperator
  attr_reader :field, :operator

  def initialize(field, operator)
    @field, @operator = field, operator
  end unless method_defined?(:initialize)


  def evaluate(value)
    warn "[DEPRECATION] evaluation of GetResponse operators is deprecated."
    { field.to_s => { gr_operator => value } }
  end


  def gr_operator
    GetResponse::OPERATORS[@operator]
  end
end


class Symbol
  GetResponse::OPERATORS.keys.each do |operator|
    define_method(operator) do
      SymbolOperator.new(self, operator)
    end unless method_defined?(operator)
  end
end

GetResponse.autoload :GetResponseError, "get_response/get_response_error"
GetResponse.autoload :Account, "get_response/account"
GetResponse.autoload :Campaign, "get_response/campaign"
GetResponse.autoload :Connection, "get_response/connection"
GetResponse.autoload :Contact, "get_response/contact"
GetResponse.autoload :Message, "get_response/message"
GetResponse.autoload :CampaignProxy, "get_response/campaign_proxy"
GetResponse.autoload :ContactProxy, "get_response/contact_proxy"
GetResponse.autoload :FromField, "get_response/from_field"
GetResponse.autoload :FromFieldsProxy, "get_response/from_fields_proxy"
GetResponse.autoload :Domain, "get_response/domain"
GetResponse.autoload :DomainProxy, "get_response/domain_proxy"
GetResponse.autoload :MessageProxy, "get_response/message_proxy"
GetResponse.autoload :Newsletter, "get_response/newsletter"
GetResponse.autoload :FollowUp, "get_response/follow_up"
GetResponse.autoload :ConfirmationBody, "get_response/confirmation_body"
GetResponse.autoload :ConfirmationBodyProxy, "get_response/confirmation_body_proxy"
GetResponse.autoload :ConfirmationSubject, "get_response/confirmation_subject"
GetResponse.autoload :ConfirmationSubjectProxy, "get_response/confirmation_subject_proxy"