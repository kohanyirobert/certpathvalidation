rem generate certficate signing request for intermediate's public key to file
keytool -certreq^
 -alias intermediate^
 -file intermediate.csr^
 -keypass changeit^
 -keystore intermediate.%_storetype%^
 -storepass changeit^
 -storetype %_storetype%^
 -v
