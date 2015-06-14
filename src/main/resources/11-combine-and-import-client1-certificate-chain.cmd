rem combine client1's certification chain and import it to its keystore
copy /b client1.pem+root.pem client1_combined.pem
keytool -importcert^
 -trustcacerts^
 -alias client1^
 -file client1_combined.pem^
 -keypass changeit^
 -keystore client1.%_storetype%^
 -noprompt^
 -rfc^
 -storepass changeit^
 -storetype %_storetype%^
 -v
