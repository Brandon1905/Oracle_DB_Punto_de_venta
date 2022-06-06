create or replace noneditionable package SEND_MAIL_TEST
is
       procedure mail_test(
        msg_to in varchar2
       ,msg_subject in varchar2
       ,msg_text in varchar2
  );
end;
/
