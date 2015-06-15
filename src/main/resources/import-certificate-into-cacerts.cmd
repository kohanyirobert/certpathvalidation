set _ca=%1%
for %%a in (%_cacerts%) do (
rem import %_ca% certificate into %%a
keytool -importcert^
 -alias %_ca%^
 -file %_ca%.pem^
 -keypass changeit^
 -keystore %%a^
 -rfc^
 -storepass changeit^
 -storetype jks^
 -v
)
