CLASS lhc_Student DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Student RESULT result.
    METHODS setactive FOR MODIFY
      IMPORTING keys FOR ACTION student~setactive RESULT result.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR student RESULT result.
    METHODS validateage FOR VALIDATE ON SAVE
      IMPORTING keys FOR student~validateage.
    METHODS updatecoursedur FOR DETERMINE ON SAVE
      IMPORTING keys FOR student~updatecoursedur.

ENDCLASS.

CLASS lhc_Student IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD setActive.

    MODIFY ENTITIES OF ZI_Student_356 IN LOCAL MODE
    ENTITY Student
    UPDATE
    FIELDS ( Status )
    WITH VALUE #( FOR key IN keys ( %tky = key-%tky Status = abap_true ) )
    FAILED failed
    REPORTED reported.

    "Get the response updated record
    READ ENTITIES OF ZI_Student_356 IN LOCAL MODE
    ENTITY Student
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(studentdata).
    result = VALUE #( FOR studentrec IN studentdata
                       ( %tky = studentrec-%tky %param = studentrec ) ).

  ENDMETHOD.

  METHOD get_instance_features.

    READ ENTITIES OF ZI_Student_356 IN LOCAL MODE
    ENTITY Student
    FIELDS ( Status ) WITH CORRESPONDING #( keys )
    RESULT DATA(studentadmitted)
    FAILED failed.

    result =
    VALUE #(
    FOR stud IN studentadmitted
    LET statusval = COND #( WHEN stud-Status = abap_true
                              THEN if_abap_behv=>fc-o-disabled
                              ELSE if_abap_behv=>fc-o-enabled )

                              IN ( %tky = stud-%tky
                                   %action-SetActive = statusval ) ).


  ENDMETHOD.

  METHOD ValidateAge.

    READ ENTITIES OF ZI_Student_356 IN LOCAL MODE
    ENTITY Student
    FIELDS ( Age ) WITH CORRESPONDING #( keys )
    RESULT DATA(studentsAge).

    LOOP AT studentsage INTO DATA(studentAge).

      IF studentage-Age < 21.
        APPEND VALUE #( %tky = studentage-%tky ) TO failed-student.

        APPEND VALUE #( %tky = keys[ 1 ]-%tky
                        %msg = new_message_with_text(
                        severity = if_abap_behv_message=>severity-error
                        text = 'Age can not be less than 21' ) )
                        TO reported-student.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.

  METHOD UpdateCourseDur.

    READ ENTITIES OF ZI_Student_356 IN LOCAL MODE
    ENTITY Student
    FIELDS ( Course ) WITH CORRESPONDING #( keys )
    RESULT DATA(StudentsCourse).

    LOOP AT studentscourse INTO DATA(StudentCourse).

      IF studentcourse-Course = 'BCA'.

        MODIFY ENTITIES OF ZI_Student_356 IN LOCAL MODE
        ENTITY Student
        UPDATE
        FIELDS ( Coursedur ) WITH VALUE #( ( %tky = studentcourse-%tky Coursedur = 3 ) ).

      ENDIF.

      IF studentcourse-Course = 'BBA'.

        MODIFY ENTITIES OF ZI_Student_356 IN LOCAL MODE
        ENTITY Student
        UPDATE
        FIELDS ( Coursedur ) WITH VALUE #( ( %tky = studentcourse-%tky Coursedur = 3 ) ).

      ENDIF.

      IF studentcourse-Course = 'MCA'.

        MODIFY ENTITIES OF ZI_Student_356 IN LOCAL MODE
        ENTITY Student
        UPDATE
        FIELDS ( Coursedur ) WITH VALUE #( ( %tky = studentcourse-%tky Coursedur = 2 ) ).

      ENDIF.

      IF studentcourse-Course = 'MBA'.

        MODIFY ENTITIES OF ZI_Student_356 IN LOCAL MODE
        ENTITY Student
        UPDATE
        FIELDS ( Coursedur ) WITH VALUE #( ( %tky = studentcourse-%tky Coursedur = 2 ) ).

      ENDIF.

    ENDLOOP.


  ENDMETHOD.

ENDCLASS.
