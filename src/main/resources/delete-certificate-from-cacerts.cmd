set _ca=%1%
for %%a in (%_cacerts%) do (
rem delete %_ca% certificate from %%a
keytool -delete^
 -alias %_ca%^
 -keypass changeit^
 -keystore %%a^
 -storepass changeit^
 -storetype jks^
 -v
)
