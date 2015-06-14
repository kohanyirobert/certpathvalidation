rem sign client1's certificate signing request using server's private key and save it to file
keytool -gencert^
 -alias server^
 -infile client1.csr^
 -keypass changeit^
 -keystore server.%_storetype%^
 -outfile client1.pem^
 -rfc^
 -sigalg sha512withrsa^
 -storepass changeit^
 -storetype %_storetype%^
 -v
