rem import server's certificate chain to client1's keystore
keytool -importcert^
 -alias server^
 -file server_combined.pem^
 -keypass changeit^
 -keystore client1.%_storetype%^
 -noprompt^
 -rfc^
 -storepass changeit^
 -storetype %_storetype%^
 -v
