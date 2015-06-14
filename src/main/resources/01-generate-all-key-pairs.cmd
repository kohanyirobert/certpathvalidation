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

rem generate server's key pair
keytool -genkeypair^
 -alias server^
 -destalias server^
 -dname "CN=server, OU=server, O=server, L=server, S=server, C=server"^
 -keyalg rsa^
 -keypass changeit^
 -keysize 1024^
 -keystore server.%_storetype%^
 -sigalg sha512withrsa^
 -storepass changeit^
 -storetype %_storetype%^
 -v

rem generate client1's key pair
keytool -genkeypair^
 -alias client1^
 -destalias client1^
 -dname "CN=client1, OU=client1, O=client1, L=client1, S=client1, C=client1"^
 -keyalg rsa^
 -keypass changeit^
 -keysize 1024^
 -keystore client1.%_storetype%^
 -sigalg sha512withrsa^
 -storepass changeit^
 -storetype %_storetype%^
 -v

rem generate client2's key pair
keytool -genkeypair^
 -alias client2^
 -destalias client2^
 -dname "CN=client2, OU=client2, O=client2, L=client2, S=client2, C=client2"^
 -keyalg rsa^
 -keypass changeit^
 -keysize 1024^
 -keystore client2.%_storetype%^
 -sigalg sha512withrsa^
 -storepass changeit^
 -storetype %_storetype%^
 -v
