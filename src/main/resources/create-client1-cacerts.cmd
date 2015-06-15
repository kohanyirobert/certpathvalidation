rem create client1's cacerts
for %%a in (root intermediate server client1) do (
keytool -importcert^
 -alias %%a^
 -file %%a.pem^
 -keypass changeit^
 -keystore client1_cacerts.%_storetype%^
 -rfc^
 -storepass changeit^
 -storetype %_storetype%^
 -v
 )
