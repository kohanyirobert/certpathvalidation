call env
call 03-delete-old-root-certificate-from-cacerts
del *.csr
del *.pem
del *.%_storetype%
