package action.reviewAction;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import svc.productSvc.BoardWriteProService;
import svc.reviewSvc.ReviewWriteProService;
import vo.ActionForward;
import vo.BoardBean;
import vo.ReviewBean;

public class ReviewWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReviewWriteProAction");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();

		String customer_id = (String)session.getAttribute("sId");  
		
		int order_num = 7;

				
//				Integer.parseInt(request.getParameter("order_num"));
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(customer_id == null) {
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.')");
			out.println("window.open('MemberLoginForm.me','_blank','height=500,width=500, status=yes,toolbar=no,menubar=no,location=no')");
			
			out.println("</script>");
			
			
		} else {
		
		
		String realFolder = "";//업로드할 파일이 저장되는 실제경로
		String saveFolder = "/review/reviewImg";//이클립스에서 관리하는 가상업로드 폴더
		int fileSize = 1024 * 1024 *10;//Byte=>KB=>MB=>10MB
		
		ServletContext context = request.getServletContext();
		realFolder = context.getRealPath(saveFolder);
		
		System.out.println(realFolder);
		
		MultipartRequest multi = new MultipartRequest(
				request,//실제 요청 정보가 포함되어있는 request객체
				realFolder,//실제 업로드 폴더 경로
				fileSize,//파일크기
				"UTF-8", //한글파일명에 대한 인코딩 방식 지정
				new DefaultFileRenamePolicy()//동일한 파일명에 대한 중복차리 담당 객체
		);
		
		ReviewBean review = new ReviewBean();
		
		review.setProduct_num(Integer.parseInt(multi.getParameter("product_num"))); 
		review.setReview_id(multi.getParameter("review_id")); 
		review.setReview_content(multi.getParameter("review_content")); 
		review.setReview_score(Double.parseDouble(multi.getParameter("review_score"))); 
		
		String file = multi.getFileNames().nextElement().toString();
		String board_file = multi.getFilesystemName(file);
		
		
		review.setReview_img(board_file); 
		
		System.out.println(review.getProduct_num());
		System.out.println(review.getReview_id());
		System.out.println(review.getReview_content());
		System.out.println(review.getReview_score());
		
		System.out.println(review.getReview_img());
		
		
		ReviewWriteProService scv = new ReviewWriteProService();
		
		boolean isWriteSuccess =  scv.registReview(review,order_num);
		
		
		//글쓰기 결과 (isWriteSuccess)를 판별하여
		//1) 실패 시 자바스크립트를 사용하여 :게시물 등록 실패!" 출력 후 이전 페이지로 돌아가기
		//2) 성공 시 ActionForward 객체를 통해 BoardList.bo 경로, Redirect 방식 포워딩 설정
		if(!isWriteSuccess) {
			//1) 실패시 자바스크립트를 이용하여 실패
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out1 = response.getWriter();
			out1.println("<script>");
			out1.println("alert('게시물 등록 실패!')");
			out1.println("history.back()");
			out1.println("</script>");
		}else {
			
			//ActionForward 객테를 생성하여 BoardList.bo서블릿 주소 요청
			//=>request 객체 유지 불필요, 주소유지 불필요,
			//새로운 요청이 발생하므로 redirect방식 포워딩
			
			forward = new ActionForward();
			forward.setPath("Review.my");
			forward.setRedirect(true);
			
			
		}

		
		}
		return forward;
	}

}
