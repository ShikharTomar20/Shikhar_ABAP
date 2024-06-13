@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help for Role'
define root view entity ZI_Role_VH as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name:'ZS4D356_DM_ROLE' )
{
          @UI.hidden: true
  key domain_name,
  key value_position,
      @Semantics.language: true
  key language,
      value_low as Value,
      @Semantics.text: true
      text      as Description
      
}
