call env
call generate-all-key-pairs.cmd
call export-root-certificate.cmd
call import-certificate-into-cacerts.cmd root
call generate-certificate-signing-requests.cmd
call sign-and-import-certificate.cmd root intermediate
call sign-and-import-certificate.cmd intermediate server
call sign-and-import-certificate.cmd server client1
call import-certificate-into-cacerts.cmd intermediate
call import-certificate-into-cacerts.cmd server
call create-server-cacerts.cmd
call create-client1-cacerts.cmd
