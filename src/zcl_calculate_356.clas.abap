CLASS zcl_calculate_356 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_sadl_exit_calc_element_read.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_calculate_356 IMPLEMENTATION.
  METHOD if_sadl_exit_calc_element_read~calculate.

    DATA: lt_TeamData TYPE STANDARD TABLE OF ZC_UXTeam_356 WITH DEFAULT KEY.
    lt_teamdata = CORRESPONDING #( it_original_data ).

    LOOP AT lt_teamdata ASSIGNING FIELD-SYMBOL(<lfs_team>).

      IF ( <lfs_team>-Role EQ 'UX' ).
        <lfs_team>-MonthlyAmount = 20000.
      ELSEIF ( <lfs_team>-Role EQ 'RE' ).
        <lfs_team>-MonthlyAmount = 15000.
      ELSEIF ( <lfs_team>-Role EQ 'UI' ).
        <lfs_team>-MonthlyAmount = 20000.
      ELSEIF ( <lfs_team>-Role EQ 'UT' ).
        <lfs_team>-MonthlyAmount = 12000.
      ENDIF.

    ENDLOOP.

    ct_calculated_data = CORRESPONDING #( lt_teamdata ).

  ENDMETHOD.

  METHOD if_sadl_exit_calc_element_read~get_calculation_info.

  ENDMETHOD.

ENDCLASS.
