@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View Entity for UXTeam'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true

define root view entity ZI_UXTeam_356
  as select from zs4d356_d_uxteam
  association [0..1] to ZI_Role_VH as _Role on $projection.Role = _Role.Value

{

  key id                 as Id,
      firstname          as Firstname,
      lastname           as Lastname,
      age                as Age,
      role               as Role,
      _Role.Description  as RoleDescription,
      salary             as Salary,
      active             as Active,
      lastchangedat      as Lastchangedat,
      locallastchangedat as Locallastchangedat

}
