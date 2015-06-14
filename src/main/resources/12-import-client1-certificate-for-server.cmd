rem import client1's certificate to server's keystore
keytool -importcert^
 -alias client1^
 -file client1_combined.pem^
 -keypass changeit^
 -keystore server.%_storetype%^
 -noprompt^
 -rfc^
 -storepass changeit^
 -storetype %_storetype%^
 -v
