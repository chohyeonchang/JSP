<%@ page contentType="text/html; charset=utf-8" %>   
<%@ page import="java.io.* , java.util.*"%>                          
<%@ page import = "com.oreilly.servlet.MultipartRequest"%>     
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>

<%
	String uploadPath=request.getRealPath("upload"); //파일저장할 절대경로
	String id=request.getParameter("id");	
	int size = 10*1024*1024; // maxsize : 10M로 제한
	String name="";
	String subject="";
	String filename1="";
	String filename2="";
	String fileType = ""; //파일타입
	
	try{
	    MultipartRequest multi=new MultipartRequest(request,uploadPath,size,"utf-8",new DefaultFileRenamePolicy());
	   											// (전송할 파일명을 가지고있는객체, 서버상절대경로, 용량, 인코딩타입, 기본 보안 적용(중복파일명에 대한 기본 정책))
		request.setCharacterEncoding("utf-8");	
		response.setContentType("text/html; charset=UTF-8");
		
	    name=multi.getParameter("name");
	    //form 내의 input name="name" 인 아이의 value를 가져옴
	    subject=multi.getParameter("subject");
		//name = "subject"인 아이의 value 가져옴
				
	    Enumeration files = multi.getFileNames();
		//전송한 전체 파일 이름들을 가져옴
	    String file1 = (String)files.nextElement();
		//form 태그에서 <input type = "file" name = "여기"> <- 여기 부분을 가져옴
		//파일 타입 정보를 가져옴
	    String file2 = (String)files.nextElement();
		
	    filename2=multi.getFilesystemName(file1);
	    filename1 = multi.getFilesystemName(file2);
	
	
	}catch(Exception e){
	    e.printStackTrace();
	}
%>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<form name="filecheck" action="fileCheck.jsp" method="post">
    <input type="text" name="name" value="<%=name %>">
    <input type="text" name="subject" value="<%=subject %>">
    <input type="text" name="filename1" value="<%=filename1 %>">
    <input type="text" name="filename2" value="<%=filename2 %>">
</form>

<a href="#" onclick="javascript:filecheck.submit()">업로드 확인 및 다운로드 페이지이동 </a>
</body>