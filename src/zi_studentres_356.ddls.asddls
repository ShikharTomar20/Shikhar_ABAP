@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Student Result'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true

define view entity ZI_StudentRes_356
  as select from zs4d356_t_result
  association to parent ZI_Student_356 as _Student on $projection.Id = _Student.Id
  association to ZI_Course_VH          as _Course  on $projection.Course = _Course.Value
  association to ZI_Semester_VH        as _Sem     on $projection.Semester = _Sem.Value
  association to ZI_Result_VH          as _Result  on $projection.SemResult = _Result.Value
{
  key id                  as Id,
  key course              as Course,
  key semester            as Semester,
      _Course.Description as CourseDesc,
      _Sem.Description    as SemesterDesc,
      semresult           as SemResult,
      _Result.Description as ResultDesc,
      _Student
}
