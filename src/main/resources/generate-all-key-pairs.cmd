for %%a in (root intermediate server client1 client2) do (
rem generate %%a's key pair
keytool -genkeypair^
 -alias %%a^
 -destalias %%a^
 -dname "CN=%%a, OU=%%a, O=%%a, L=%%a, S=%%a, C=%%a"^
 -keyalg rsa^
 -keypass changeit^
 -keysize %_keysize%^
 -keystore %%a.%_storetype%^
 -sigalg sha512withrsa^
 -storepass changeit^
 -storetype %_storetype%^
 -v
)
