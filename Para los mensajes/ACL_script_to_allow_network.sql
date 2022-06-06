DECLARE
  l_acl_name         VARCHAR2(30) := 'utl_tcp_eml.xml';
  l_ftp_server_ip    VARCHAR2(20) := 'smtp.gmail.com';
  l_ftp_server_name  VARCHAR2(20) := 'smtp.gmail.com';
  l_username         VARCHAR2(30) := 'PV';
BEGIN
  DBMS_NETWORK_ACL_ADMIN.create_acl (
    acl          => l_acl_name, 
    description  => 'Allow connections using UTL_TCP',
    principal    => l_username,
    is_grant     => TRUE, 
    privilege    => 'connect',
    start_date   => SYSTIMESTAMP,
    end_date     => NULL);

  COMMIT;

  DBMS_NETWORK_ACL_ADMIN.add_privilege ( 
    acl         => l_acl_name, 
    principal   => l_username,
    is_grant    => FALSE, 
    privilege   => 'connect', 
    position    => NULL, 
    start_date  => NULL,
    end_date    => NULL);

  COMMIT;

  DBMS_NETWORK_ACL_ADMIN.assign_acl (
    acl         => l_acl_name,
    host        => l_ftp_server_ip, 
    lower_port  => NULL,
    upper_port  => NULL);

  DBMS_NETWORK_ACL_ADMIN.assign_acl (
    acl         => l_acl_name,
    host        => l_ftp_server_name, 
    lower_port  => NULL,
    upper_port  => NULL);

  COMMIT;
END;
