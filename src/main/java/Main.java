
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.security.KeyStore;
import java.security.cert.CertPath;
import java.security.cert.CertPathValidator;
import java.security.cert.CertPathValidatorResult;
import java.security.cert.Certificate;
import java.security.cert.CertificateFactory;
import java.security.cert.PKIXParameters;
import java.util.Arrays;

public final class Main {

    private static final String STORETYPE = "jks";
    private static final char[] PASSWORD = "changeit".toCharArray();

    public static void main(String[] args) throws Exception {
        KeyStore cacertsStore = getTrustStore();
        KeyStore rootStore = getKeyStore("root");
        KeyStore intermediateStore = getKeyStore("intermediate");

        Certificate[] rootCertChain = rootStore.getCertificateChain("root");
        Certificate[] intermediateCertChain = intermediateStore.getCertificateChain("intermediate");
        CertPath rootCertPath = getCertPath(rootCertChain);
        CertPath intermediateCertPath = getCertPath(intermediateCertChain);

        PKIXParameters params = new PKIXParameters(cacertsStore);
        params.setRevocationEnabled(false);

        CertPathValidator cpv = CertPathValidator.getInstance("PKIX");
        CertPathValidatorResult rootResult = cpv.validate(rootCertPath, params);
        // for rootCertPath the validator does not throw an exception
        CertPathValidatorResult intermediateResult = cpv.validate(intermediateCertPath, params);
        // for intermediateCertPath the validator throws
        // basic constraints check failed: this is not a CA certificate
    }

    private static KeyStore getKeyStore(String name) throws Exception {
        KeyStore ks = KeyStore.getInstance(STORETYPE);
        try (InputStream is = Main.class.getResourceAsStream(name + "." + STORETYPE)) {
            ks.load(is, PASSWORD);
        }
        return ks;
    }

    private static KeyStore getTrustStore() throws Exception {
        KeyStore keystore = KeyStore.getInstance(KeyStore.getDefaultType());
        String filename = System.getProperty("java.home") + "/lib/security/cacerts".replace('/', File.separatorChar);
        try (FileInputStream is = new FileInputStream(filename)) {
            keystore.load(is, PASSWORD);
        }
        return keystore;
    }

    private static CertPath getCertPath(Certificate[] certificateChain) throws Exception {
        CertificateFactory cf = CertificateFactory.getInstance("X.509");
        CertPath cp = cf.generateCertPath(Arrays.asList(certificateChain));
        return cp;
    }
}
