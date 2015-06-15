call env
call delete-certificate-from-cacerts.cmd server
call delete-certificate-from-cacerts.cmd intermediate
call delete-certificate-from-cacerts.cmd root
del *.csr
del *.pem
del *.%_storetype%
