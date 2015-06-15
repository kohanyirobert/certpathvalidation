set _ca=%1%
set _subject=%2%
rem sign %_subject%'s certificate signing request using %_ca%'s private key and save it to file
keytool -gencert^
 -alias %_ca%^
 -infile %_subject%.csr^
 -keypass changeit^
 -keystore %_ca%.%_storetype%^
 -outfile %_subject%.pem^
 -rfc^
 -sigalg sha512withrsa^
 -storepass changeit^
 -storetype %_storetype%^
 -v

rem import %_subject%'s certification from file into its keystore
keytool -importcert^
 -trustcacerts^
 -alias %_subject%^
 -file %_subject%.pem^
 -keypass changeit^
 -keystore %_subject%.%_storetype%^
 -rfc^
 -storepass changeit^
 -storetype %_storetype%^
 -v
