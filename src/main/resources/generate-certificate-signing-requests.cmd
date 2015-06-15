for %%a in (intermediate server client1 client2) do (
rem generate certficate signing request for %%a's public key to file
keytool -certreq^
 -alias %%a^
 -file %%a.csr^
 -keypass changeit^
 -keystore %%a.%_storetype%^
 -storepass changeit^
 -storetype %_storetype%^
 -v
)
