package xeviousvs;

import java.io.*;
import java.net.*;
import java.nio.file.*;
import javax.xml.*;
import javax.xml.parsers.*;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.*;
import org.w3c.dom.Document;
import org.xml.sax.*;

public class ServerLogXml {

    private static final String percorsoXmlLog = "xmlLog.txt";
    private static final String percorsoXsdEntrataLog = "entrataLog.xsd";
    private static final int portaAscolto = 9200;

    public static void main(String[] args) {
        try (
                ServerSocket socketAscolto = new ServerSocket(portaAscolto);) {
            cicloAttesaLog(socketAscolto);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static void cicloAttesaLog(ServerSocket socketAscolto) {
        while (true) {
            try {
                Socket connessione = socketAscolto.accept();
                String log = riceviLog(connessione);
                if (log != null) {
                    if (validaLogEvento(log)) {
                        registraLogSuFile(log);
                    }
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private static String riceviLog(Socket connessioneApplicazione) {
        try (
                DataInputStream din = new DataInputStream(connessioneApplicazione.getInputStream());) {
            return din.readUTF();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }

    private static boolean validaLogEvento(String logEventoRicevuto) {
        try {
            DocumentBuilder db = DocumentBuilderFactory.newInstance().newDocumentBuilder();
            SchemaFactory sf = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);

            Document d = db.parse(new InputSource(new ByteArrayInputStream(logEventoRicevuto.getBytes("utf-8"))));
            Schema s = sf.newSchema(new StreamSource(new File(percorsoXsdEntrataLog)));
            s.newValidator().validate(new DOMSource(d));
        } catch (Exception e) {
            if (e instanceof SAXException) {
                System.out.println("Errore di validazione:" + e.getMessage());
                return false;
            } else {
                e.printStackTrace();
                return false;
            }
        }
        return true;
    }

    private static void registraLogSuFile(String logEventoRicevuto) {
        try {
            Files.write(Paths.get(percorsoXmlLog), (logEventoRicevuto + "\n\n").getBytes(), StandardOpenOption.CREATE, StandardOpenOption.APPEND);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
