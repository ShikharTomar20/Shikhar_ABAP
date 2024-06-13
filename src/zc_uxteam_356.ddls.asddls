@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View for UXTeam'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true

define root view entity ZC_UXTeam_356
  as projection on ZI_UXTeam_356 as UXTeam
{
          @EndUserText.label: 'Student ID'
  key     Id,
          @EndUserText.label: 'First Name'
          Firstname,
          @EndUserText.label: 'Last Name'
          Lastname,
          @EndUserText.label: 'Age'
          Age,
          @EndUserText.label: 'Designation'
          Role,
          @EndUserText.label: 'Role Description'
          RoleDescription,
          @UI.hidden: true
          Salary,
          @EndUserText.label: 'Active'
          Active,
          @UI.hidden: true
          Lastchangedat,
          @UI.hidden: true
          Locallastchangedat,

          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_CALCULATE_356'
          @EndUserText.label: 'Monthly Salary'
  virtual MonthlyAmount : abap.int4
}
