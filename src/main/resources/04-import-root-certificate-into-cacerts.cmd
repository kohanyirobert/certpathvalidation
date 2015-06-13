rem import root certificate into cacerts
for %%a in (%_cacerts%) do keytool -importcert^
 -trustcacerts^
 -alias root^
 -file root.pem^
 -keypass changeit^
 -keystore %%a^
 -noprompt^
 -rfc^
 -storepass changeit^
 -storetype jks^
 -v
