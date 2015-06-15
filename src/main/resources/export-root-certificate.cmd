keytool -exportcert^
 -alias root^
 -file root.pem^
 -keystore root.%_storetype%^
 -rfc^
 -storepass changeit^
 -storetype %_storetype%^
 -v
