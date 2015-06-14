
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.security.KeyStore;
import java.security.SignatureException;
import java.security.cert.CertPath;
import java.security.cert.CertPathValidator;
import java.security.cert.Certificate;
import java.security.cert.CertificateFactory;
import java.security.cert.PKIXParameters;
import java.security.cert.TrustAnchor;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Scanner;
import java.util.Set;
import javax.xml.bind.DatatypeConverter;

public final class Main {

    private static final String STORETYPE = "jks";
    private static final char[] PASSWORD = "changeit".toCharArray();
    private static final String CACERTS = System.getProperty("java.home") + "/lib/security/cacerts".replace('/', File.separatorChar);

    public static void main(String[] args) throws Exception {
        validateCertificateChain("root");
        validateCertificateChain("intermediate");
        validateCertificateChain("server");
        validateCertificateChain("client1");
        validateCertificateChain("client2");
    }

    static void validateCertificateChain(String alias) throws Exception {
        Set<TrustAnchor> trustAnchors = new LinkedHashSet<>();

        KeyStore trustStore = getTrustStore();
        final ArrayList<String> trustedAliases = Collections.list(trustStore.aliases());
        for (String trustedAlias : trustedAliases) {
            trustAnchors.add(new TrustAnchor((X509Certificate) trustStore.getCertificate(trustedAlias), null));
        }

        KeyStore keyStore = getKeyStore(alias);
        Certificate[] certificateChain = keyStore.getCertificateChain(alias);
        Certificate subjectCertificate = certificateChain[0];
        List<Certificate> otherCertificates = Arrays.asList(certificateChain).subList(1, certificateChain.length);
        for (Certificate certificate : otherCertificates) {
            if (isSelfSigned(certificate)) {
                continue;
            }
            trustAnchors.add(new TrustAnchor((X509Certificate) certificate, null));
        }

        CertificateFactory cf = CertificateFactory.getInstance("X.509");
        CertPath certPath = cf.generateCertPath(Arrays.asList(subjectCertificate));
        CertPathValidator cpv = CertPathValidator.getInstance(CertPathValidator.getDefaultType());
        PKIXParameters pp = new PKIXParameters(trustAnchors);
        pp.setRevocationEnabled(false);
        cpv.validate(certPath, pp);
    }

    static KeyStore getKeyStore(String name) throws Exception {
        KeyStore ks = KeyStore.getInstance(STORETYPE);
        try (InputStream is = Main.class.getResourceAsStream(name + "." + STORETYPE)) {
            ks.load(is, PASSWORD);
        }
        return ks;
    }

    static KeyStore getTrustStore() throws Exception {
        KeyStore ks = KeyStore.getInstance(KeyStore.getDefaultType());
        try (FileInputStream is = new FileInputStream(CACERTS)) {
            ks.load(is, PASSWORD);
        }
        return ks;
    }

    static boolean isSelfSigned(Certificate certificate) throws Exception {
        try {
            certificate.verify(certificate.getPublicKey());
            return true;
        } catch (SignatureException ex) {
            return false;
        }
    }

    static Certificate[] getCertificates(String pem) throws Exception {
        InputStream is = Main.class.getResourceAsStream(pem + ".pem");
        String s = convertStreamToString(is);
        s = s.replaceAll("-----BEGIN CERTIFICATE-----", "");
        s = s.replaceAll("-----END CERTIFICATE-----", "");
        byte[] decoded = DatatypeConverter.parseBase64Binary(s);
        CertificateFactory cf = CertificateFactory.getInstance("X.509");
        Collection<? extends Certificate> generateCertificates = cf.generateCertificates(new ByteArrayInputStream(decoded));
        return generateCertificates.toArray(new Certificate[0]);
    }

    static String convertStreamToString(InputStream is) {
        Scanner s = new Scanner(is).useDelimiter("\\A");
        return s.hasNext() ? s.next() : "";
    }
}
