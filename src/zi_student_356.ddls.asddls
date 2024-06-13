@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View Entity for Student'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true

define root view entity ZI_Student_356
  as select from zs4d356_t_stu
  composition [0..*] of ZI_StudentRes_356 as _AcademicResult
  association [0..1] to ZI_Gender_VH      as _Gender on $projection.Gender = _Gender.Value

{
  key id                  as Id,
      firstname           as Firstname,
      lastname            as Lastname,
      age                 as Age,
      course              as Course,
      coursedur           as Coursedur,
      status              as Status,
      gender              as Gender,
      dob                 as Dob,
      lastchangedat       as LastChangedAt,
      locallastchangedat  as LocallastChangedAt,
      _Gender,
      _Gender.Description as GenderDesc,
      _AcademicResult
}
