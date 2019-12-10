package bbs;

public class FileDTO {
   
   String name;
   String subject;
   String filename1;
   String filename2;
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getSubject() {
      return subject;
   }
   public void setSubject(String subject) {
      this.subject = subject;
   }
   public String getFilename1() {
      return filename1;
   }
   public void setFilename1(String filename1) {
      this.filename1 = filename1;
   }
   public String getFilename2() {
      return filename2;
   }
   public void setFilename2(String filename2) {
      this.filename2 = filename2;
   }
   public FileDTO(String name, String subject, String filename1, String filename2) {
      super();
      this.name = name;
      this.subject = subject;
      this.filename1 = filename1;
      this.filename2 = filename2;
   }

   
}