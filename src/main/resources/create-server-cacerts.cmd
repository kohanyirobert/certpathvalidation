rem create server's cacerts
for %%a in (root intermediate server client1) do (
keytool -importcert^
 -alias %%a^
 -file %%a.pem^
 -keypass changeit^
 -keystore server_cacerts.%_storetype%^
 -rfc^
 -storepass changeit^
 -storetype %_storetype%^
 -v
 )
