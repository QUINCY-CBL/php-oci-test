<?php
 $tns ='(DESCRIPTION = (ADDRESS = (PROTOCOL = TCP)(HOST = 172.30.0.51 )(PORT = 1994)) (CONNECT_DATA = (SERVER = DEDICATED) (SERVICE_NAME = bhav98)))';
 $conn = oci_connect('C00611','s0ftb411',$tns) or die;
 
 $sql = 'BEGIN C00611.DISC_TIMESANDDEPOSITS_BYACC(:acct_no,:disc_date,:tot_disc,:lst_deposit,:ldgr_date); END;';
 
 $stmt = oci_parse($conn,$sql);
 
 // Bind the input parameter
 oci_bind_by_name($stmt,':acct_no',$acct_no,32);
 
 // Bind the output parameter
 oci_bind_by_name($stmt,':disc_date',$disc_date,32);
 oci_bind_by_name($stmt,':tot_disc',$tot_disc,32);
 oci_bind_by_name($stmt,':lst_deposit',$lst_deposit,32);
 oci_bind_by_name($stmt,':ldgr_date',$ldgr_date,32);

 $acct_no = '24488301';
 
 oci_execute($stmt);
 
 // $message is now populated with the output value
 print "Disconnection Date: $disc_date\n Total Num Disconnections: $tot_disc\n Last Deposit: $lst_deposit\n Date: $ldgr_date\n";
 ?>