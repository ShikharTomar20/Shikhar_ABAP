CLASS lhc_UXTeam DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR UXTeam RESULT result.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR UXTeam RESULT result.
    METHODS setactive FOR MODIFY
      IMPORTING keys FOR ACTION uxteam~setactive RESULT result.

ENDCLASS.

CLASS lhc_UXTeam IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD SetActive.

    MODIFY ENTITIES OF ZI_UXTeam_356 IN LOCAL MODE
    ENTITY UXTeam
    UPDATE
    FIELDS ( Active )
    WITH VALUE #( FOR key IN keys ( %tky = key-%tky Active = abap_true ) )
    FAILED failed
    REPORTED reported.

    "Get the response updated record
    READ ENTITIES OF ZI_UXTeam_356 IN LOCAL MODE
    ENTITY UXTeam
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(teamdata).
    result = VALUE #( FOR teamrec IN teamdata
                       ( %tky = teamrec-%tky %param = teamrec ) ).

  ENDMETHOD.

  METHOD get_instance_features.

    READ ENTITIES OF ZI_UXTeam_356 IN LOCAL MODE
    ENTITY UXTeam
    FIELDS (  Active ) WITH CORRESPONDING #( keys )
    RESULT DATA(resourseactivated)
    FAILED failed.

    result =
    VALUE #(
    FOR resource IN resourseactivated
    LET activeval = COND #( WHEN resource-Active = abap_true
                              THEN if_abap_behv=>fc-o-disabled
                              ELSE if_abap_behv=>fc-o-enabled )

                              IN ( %tky = resource-%tky
                                   %action-SetActive = activeval ) ).

  ENDMETHOD.

ENDCLASS.
