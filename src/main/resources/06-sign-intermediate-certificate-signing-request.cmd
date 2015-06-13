rem sign intermediate's certificate signing request using root's private key and save it to file
keytool -gencert^
 -alias root^
 -infile intermediate.csr^
 -keypass changeit^
 -keystore root.%_storetype%^
 -outfile intermediate.pem^
 -rfc^
 -sigalg sha512withrsa^
 -storepass changeit^
 -storetype %_storetype%^
 -v

rem import intermediate's certification from file into its keystore
keytool -importcert^
 -trustcacerts^
 -alias intermediate^
 -file intermediate.pem^
 -keypass changeit^
 -keystore intermediate.%_storetype%^
 -noprompt^
 -rfc^
 -storepass changeit^
 -storetype %_storetype%^
 -v
