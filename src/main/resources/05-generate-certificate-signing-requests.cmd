rem generate certficate signing request for intermediate's public key to file
keytool -certreq^
 -alias intermediate^
 -file intermediate.csr^
 -keypass changeit^
 -keystore intermediate.%_storetype%^
 -storepass changeit^
 -storetype %_storetype%^
 -v

rem generate certficate signing request for server's public key to file
keytool -certreq^
 -alias server^
 -file server.csr^
 -keypass changeit^
 -keystore server.%_storetype%^
 -storepass changeit^
 -storetype %_storetype%^
 -v

rem generate certficate signing request for client1's public key to file
keytool -certreq^
 -alias client1^
 -file client1.csr^
 -keypass changeit^
 -keystore client1.%_storetype%^
 -storepass changeit^
 -storetype %_storetype%^
 -v

rem generate certficate signing request for client2's public key to file
keytool -certreq^
 -alias client2^
 -file client2.csr^
 -keypass changeit^
 -keystore client2.%_storetype%^
 -storepass changeit^
 -storetype %_storetype%^
 -v
