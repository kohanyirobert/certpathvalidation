rem sign server's certificate signing request using intermediate's private key and save it to file
keytool -gencert^
 -alias intermediate^
 -infile server.csr^
 -keypass changeit^
 -keystore intermediate.%_storetype%^
 -outfile server.pem^
 -rfc^
 -sigalg sha512withrsa^
 -storepass changeit^
 -storetype %_storetype%^
 -v
