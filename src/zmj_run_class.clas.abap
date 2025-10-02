CLASS zmj_run_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zmj_run_class IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA(system_prompt) = |Give some tips what to visist in Poland|.



    TRY.
        DATA(api) = cl_aic_islm_compl_api_factory=>get(  )->create_instance( islm_scenario = 'TEST' ).
      CATCH cx_aic_api_factory.
        "handle exception
    ENDTRY.

    FINAL(message_container) = api->create_message_container( ).

    message_container->set_system_role( system_prompt ).

    data(tips) = api->execute_for_messages( message_container )->get_completion(  ).

    out->write( |Tips for visiting Poland: { tips }| ).

  ENDMETHOD.
ENDCLASS.
