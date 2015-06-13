rem generate root's key pair
keytool -genkeypair^
 -alias root^
 -destalias root^
 -dname "CN=root, OU=root, O=root, L=root, S=root, C=root"^
 -keyalg rsa^
 -keypass changeit^
 -keysize 1024^
 -keystore root.%_storetype%^
 -sigalg sha512withrsa^
 -storepass changeit^
 -storetype %_storetype%^
 -v

rem generate intermediate's key pair
keytool -genkeypair^
 -alias intermediate^
 -destalias intermediate^
 -dname "CN=intermediate, OU=intermediate, O=intermediate, L=intermediate, S=intermediate, C=intermediate"^
 -keyalg rsa^
 -keypass changeit^
 -keysize 1024^
 -keystore intermediate.%_storetype%^
 -sigalg sha512withrsa^
 -storepass changeit^
 -storetype %_storetype%^
 -v
