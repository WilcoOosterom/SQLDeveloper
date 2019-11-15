---------------------------
--New PROCEDURE
--INSTALL_OTAP_SPECIFIEK
---------------------------
CREATE OR REPLACE PROCEDURE "RPT_VIEW_USER_RIS"."INSTALL_OTAP_SPECIFIEK" --  exec install_otap_specifiek; 
as
/* 
** =================================================================================================================================
**
** Purpose:         De procedure INSTALL_OTAP_SPECIFIEK heeft een paar doelen:
**                  1) Het instellen van mailgroepen per OTAP instance
**                  2) Het informeren over OTAP specifieke zaken.
**                  3) Het uitsluiten van EDX trigger acties voor Qlikview (indien gewenst) middels update op grip_job.
**
**                  Installeer deze procedure onder het bijbehorende schema en roep de procedure aan om de instellingen te activeren.
**                  De GRIP_SYS_PARAMETERS wordt bijgewerkt. 
**                  De install_otap_specifiek wordt ook altijd aangeroepen vanuit de main flows.
**                  
**
** Developer        Version    Date        Description
** ------------     -------    ----------  ------------------------------------------------------------------------------------------------                                   
** Joost van Steeg  1.0        26-04-2018  BICC-2360 - Wijziging in werkwijze. Er wordt nu gekeken naar de huidige omgeving, ipv hardcoded omgevingnamen.                                             
** Wilco Oosterom   1.1        19-06-2018  BICC-2360 - Wijziging tbv RIS_STG en RIS_DM.                                             
*/

    l_omgeving  varchar2(1);
    l_otap_node varchar2(30);

begin

    select  substr(name, length(name) , 1) omgeving
    into    l_omgeving
    from    v$database
    ;

    select  decode(l_omgeving, 'O', 'ONTWIKKEL', 'T', 'TEST', 'A', 'ACCEPTATIE', 'P', 'PRODUCTIE', 'ONBEKEND') 
    into    l_otap_node
    from    dual;

    grip_utils.check_label('OTAP_NODE'              ,'De node waarop de programmatuur geinstalleerd wordt.'   );
    grip_utils.check_label('MAILQUERY_BEHEER_1'     ,'Mailing-lijst technischbeheer'   );
    grip_utils.check_label('MAILQUERY_FUNCTIONEEL_1','Mailing-lijst functioneelbeheer'   );
    grip_utils.check_label('MAILQUERY_FUNCTIONEEL_2','Mailing-lijst functioneelbeheer-2' );
    grip_utils.check_label('MAILQUERY_FUNCTIONEEL_4','Mail-adressen van FB en Ordina BI beheer');
    grip_utils.check_label('DEFAULT_MAIL_TO'        ,'Mailing-lijst algemeen default'                         );    

    grip_utils.set_char('OTAP_NODE'                 ,l_otap_node   );

    -- Standaard mail adressen voor als een mail parameter gebruikt wordt, maar niet gevuld is:
    grip_utils.set_char('DEFAULT_MAIL_TO'           ,'datawarehousing@schiphol.nl;Peter.de.Boer@schiphol.nl;wilco.oosterom@schiphol.nl'    );

    if l_omgeving = 'P'
    then    

          grip_utils.set_char('MAILQUERY_BEHEER_1'     ,'datawarehousing@schiphol.nl;Peter.de.Boer@schiphol.nl;wilco.oosterom@schiphol.nl'    );
          grip_utils.set_char('MAILQUERY_FUNCTIONEEL_1', grip_utils.get_char('MAILQUERY_BEHEER_1'  ) );
          grip_utils.set_char('MAILQUERY_FUNCTIONEEL_2', grip_utils.get_char('MAILQUERY_BEHEER_1'  ) );
          grip_utils.set_char('MAILQUERY_FUNCTIONEEL_4', 'datawarehousing@schiphol.nl;Peter.de.Boer@schiphol.nl;wilco.oosterom@schiphol.nl;Elprana_D@schiphol.nl;wolfers@schiphol.nl'  );

    else

          grip_utils.set_char('MAILQUERY_BEHEER_1'     , 'datawarehousing@schiphol.nl;Peter.de.Boer@schiphol.nl;wilco.oosterom@schiphol.nl'   );
          grip_utils.set_char('MAILQUERY_FUNCTIONEEL_1', grip_utils.get_char('MAILQUERY_BEHEER_1'  ) );
          grip_utils.set_char('MAILQUERY_FUNCTIONEEL_2', grip_utils.get_char('MAILQUERY_BEHEER_1'  ) );
          grip_utils.set_char('MAILQUERY_FUNCTIONEEL_4', 'datawarehousing@schiphol.nl;Peter.de.Boer@schiphol.nl;wilco.oosterom@schiphol.nl'  );

          -- c_type dummy wordt automatisch genegeerd door de GRIP flow.
          -- Middels onderstaande worden de EDX aanroepen automatisch van verwerking  uitgesloten. (EDX triggers loggen in OTA in een tabel, maar roepen niet de batchverwerking van QLIKVIEW aan.
          /*grip_tapi.exec('
            update grip_job
            set c_type = ''DUMMY'' , omschr = '' EDX-triggers alleen aanroepen vanaf productie ivm ongewenste opstart van Qlikview''
            where instr(child,''EDX_AANROEP'') > 0 and username=user
            ');*/


    end if;



-- TEMPLATES zitten in de PF_RIS_CONTROLE 
--  GRIP_UTILS.check_label('MAIL_TEMPLATE_BHR1','rapportage-template');
--  
--  grip_pato.set_description( 'MAIL_TEMPLATE_BHR1', 'RIS dagelijkse rapportage' );
--  
--  GRIP_UTILS.set_char('MAIL_TEMPLATE_BHR1','
--Dagelijkse RIS-rapportage
--[''Trage queries''           ,''select * from GRIP_AUDIT1_TRAAG_V''] 
--[''Nog genoeg ruimte ?''     ,''select * from GRIP_DBA_SPACE_V''] 
--[''Doorloop PF_FLOWS ?'' ,''select * from grip_job4_v where  start_dt > sysdate -7''] 
--');

--  exec grip_pato.send_mail_template( 'MAIL_TEMPLATE_BHR1', 'BEHEER_1' )


end;
/
