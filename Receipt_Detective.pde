import static javax.swing.JOptionPane.*;

String TemplateLink = "https://apps.cbe.com.et:100/?id=";

void setup () {
String RNInput = showInputDialog("Enter the user's RN");
String LastAccDigit = showInputDialog("Enter the last 8 digit of the Account");
String ReceiptNo = RNInput + LastAccDigit;

//int RN = int (ReceiptNo);
 TemplateLink += ReceiptNo;
println (TemplateLink);

  String pdfPath = dataPath ("") + "/receipt.pdf";
  String content = readPDF (pdfPath);
  println (content);
}

String readPDF (String path) {
  try {
    PdfReader reader = new PdfReader(path);

    int pages = reader.getNumberOfPages();
    StringBuilder text = new StringBuilder();
    for (int i = 1; i <= pages; i++)
      text.append(PdfTextExtractor.getTextFromPage (reader, i));
      
    reader.close();

    return text.toString ();
  } 
  catch (Exception e) {
    return null;
  }
}

//61108592 FT24341HNN9T
