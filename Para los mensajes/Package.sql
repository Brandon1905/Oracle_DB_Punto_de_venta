create or replace noneditionable package SEND_MAIL_TEST is
  procedure mail_test(msg_to      in varchar2,
                      msg_subject in varchar2,
                      msg_text    in varchar2);
end;
/
create or replace noneditionable package body SEND_MAIL_TEST IS
procedure write_mime_header_test(

p_conn in out nocopy utl_smtp.connection, p_name in varchar2, p_value in varchar2) is
begin
utl_smtp.write_data(p_conn, p_name || ': ' || p_value || utl_tcp.crlf);
end; procedure mail_test(msg_to in varchar2, msg_subject in varchar2, msg_text in varchar2) is
mail_conn utl_smtp.connection; msg_from varchar2(50) := 'brandonsopoti@gmail.com'; -----Type Your Gmail Email ID in encoded Format----
mailhost VARCHAR2(50) := 'smtp.gmail.com'; nls_charset varchar2(255); g_mailer_id constant varchar2(256) := 'Mailer by Oracle UTL_SMTP';
BEGIN

select value into nls_charset from nls_database_parameters where parameter = 'NLS_CHARACTERSET'; mail_conn := utl_smtp.open_connection(mailhost, 587, wallet_path => 'file:C:\app\Brandon\product\18.0.0\admin\XE\wallet' /*Your Wallet Path*/
, wallet_password => 'Oracle123' /* Your Wallet Password*/
, secure_connection_before_smtp => false); utl_smtp.ehlo(mail_conn, 'smtp.gmail.com'); utl_smtp.starttls(mail_conn); utl_smtp.command(mail_conn, 'AUTH LOGIN'); utl_smtp.command(mail_conn, 'YnJhbmRvbnNvcG90aUBnbWFpbC5jb20='); --Type Your Gmail Email ID in encoded Format----
utl_smtp.command(mail_conn, 'Z2VtZWxvMTIzNDU='); --Type Your Gmail Password in encoded Format------
utl_smtp.command(mail_conn, 'MAIL FROM: <' || msg_from || '>'); utl_smtp.command(mail_conn, 'RCPT TO: <' || msg_to || '>'); utl_smtp.open_data(mail_conn); write_mime_header_test(mail_conn, 'From', msg_from); write_mime_header_test(mail_conn, 'To', msg_to); write_mime_header_test(mail_conn, 'Subject', msg_subject); write_mime_header_test(mail_conn, 'Content-Type', 'text/plain'); write_mime_header_test(mail_conn, 'X-Mailer', g_mailer_id); utl_smtp.write_data(mail_conn, utl_tcp.crlf); utl_smtp.write_data(mail_conn, msg_text); utl_smtp.close_data(mail_conn); utl_smtp.quit(mail_conn);
exception
when others then
begin
utl_smtp.quit(mail_conn);
exception
when others then null;
end; --raise_application_error(-20000, 'Failed to send mail due to the following error: ' || sqlerrm);
end;
end;
/
