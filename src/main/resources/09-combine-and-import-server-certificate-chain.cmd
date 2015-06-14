rem combine server's certification chain and import it to its keystore
copy /b server.pem+root.pem server_combined.pem
keytool -importcert^
 -trustcacerts^
 -alias server^
 -file server_combined.pem^
 -keypass changeit^
 -keystore server.%_storetype%^
 -noprompt^
 -rfc^
 -storepass changeit^
 -storetype %_storetype%^
 -v
