 begin
DBMS_NETWORK_ACL_ADMIN.APPEND_HOST_ACE(
  host => 'smtp.gmail.com',
  ace  =>  xs$ace_type(privilege_list => xs$name_list('connect'),
                       principal_name => 'PV',/*Change according to your Apex user*/
                       principal_type => xs_acl.ptype_db)); 
                       end;
                       
                       
begin
dbms_network_acl_admin.append_wallet_ace(
  wallet_path => 'file:C:\app\Brandon\product\18.0.0\admin\XE\wallet',/*Change According to your wallet path*/
  ace         =>  xs$ace_type(privilege_list => xs$name_list('use_client_certificates', 'use_passwords'),
                              principal_name => 'PV',/*Change according to your Apex user*/
                              principal_type => xs_acl.ptype_db));
end;

BEGIN
  DBMS_NETWORK_ACL_ADMIN.append_host_ace (
    host       => 'smtp.gmail.com', 
    ace        => xs$ace_type(privilege_list => xs$name_list('RESOLVE'),
                              principal_name => 'PV',/*Change according to your Apex user*/
                              principal_type => xs_acl.ptype_db)); 
END;

-- https://www.youtube.com/watch?v=LAgkyqd6nyI
