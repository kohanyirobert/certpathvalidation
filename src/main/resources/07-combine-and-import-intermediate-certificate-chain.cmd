rem combine intermediate's certification chain and import it to its keystore
copy /b intermediate.pem+root.pem intermediate_combined.pem
keytool -importcert^
 -trustcacerts^
 -alias intermediate^
 -file intermediate_combined.pem^
 -keypass changeit^
 -keystore intermediate.%_storetype%^
 -noprompt^
 -rfc^
 -storepass changeit^
 -storetype %_storetype%^
 -v
