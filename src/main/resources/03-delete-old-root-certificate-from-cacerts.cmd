rem delete old root certificate from cacerts
for %%a in (%_cacerts%) do keytool -delete^
 -alias root^
 -keypass changeit^
 -keystore %%a^
 -storepass changeit^
 -storetype jks^
 -v
