package action.productAction;

import java.io.*;
import java.util.*;

import javax.naming.*;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.*;

import action.Action;
import svc.productSvc.BoardWriteProService;
import vo.*;

public class BoardWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");// Post로 보냈음

		System.out.println("Board(현Product)WritePro - action");
		ActionForward forward = null;

		BoardBean boardBean = new BoardBean();

		String realFolder = "";
//        String realFolder = "C:\\Users\\JSW\\git\\Banchan\\Project_BC\\src\\main\\webapp\\upload";//프로젝트 절대경로.
		String saveFolder = "/img";

		ServletContext context = request.getSession().getServletContext();
		realFolder = context.getRealPath(saveFolder);
		System.out.println(realFolder);

		int size = 1024 * 1024 * 10;

		MultipartRequest multi = new MultipartRequest(request, // request객체
				realFolder, // 업로드 폴더
				size, // 업로드 파일 사이즈
				"UTF-8", // 업로드 파일 인코딩 타입
				new DefaultFileRenamePolicy()

		);

		// 상품정보 받아옴
		String name = multi.getParameter("product_name");
		String seller_id = multi.getParameter("seller_id");
		String category = multi.getParameter("product_category") + multi.getParameter("product_category2");
		int price = Integer.parseInt(multi.getParameter("product_price").trim());
		int weight = Integer.parseInt(multi.getParameter("product_weight").trim());
		int discount = Integer.parseInt(multi.getParameter("product_discount").trim());
		int stock = Integer.parseInt(multi.getParameter("product_stock").trim());
		String expiration = multi.getParameter("product_expiration_date");
		String handling = multi.getParameter("product_handling");
		String material = multi.getParameter("product_material");

//        System.out.println(name+"|"+Sname+"|"+category+"|"+price+"|"+weight+"|"+discount+"|"+stock+"|"+expiration+"|"+handling+"|"+material);

		boardBean.setProduct_name(name);
		boardBean.setSeller_id(seller_id);
		boardBean.setProduct_category(category);
		boardBean.setProduct_price(price);
		boardBean.setProduct_weight(weight);
		boardBean.setProduct_discount(discount);
		boardBean.setProduct_stock(stock);
		boardBean.setProduct_expiration_date(expiration);
		boardBean.setProduct_handling(handling);
		boardBean.setProduct_material(material);

		BoardWriteProService service = new BoardWriteProService();

		// 2) BoardWriteProService 인스턴스의 registArticle() 메서드 호출하여 게시물 등록 요청
		// => 파라미터 : BoardBean 객체, 리턴타입 : boolean(isWriteSuccess)
		boolean isWriteSuccess = service.registArticle(boardBean);
		boolean isImageSuccess = false;

		// 글쓰기 결과(isWriteSuccess)를 판별
		if (!isWriteSuccess) { // 작업 결과가 false 일 경우
			// 1) 실패 시 자바스크립트를 사용하여 "게시물 등록 실패!" 출력 후 이전페이지로 돌아가기
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('게시물 등록 실패!')");
			out.println("history.back()");
			out.println("</script>");
		} else { // 작업 결과가 true 일 경우
			// 2) 성공 시 ActionForward 객체를 통해 BoardList.bo 경로, Redirect 방식 포워딩 설정
			// ActionForward 객체를 생성하여 BoardList.bo 서블릿 주소 요청
			// => request 객체 유지 불필요, 주소 유지 불필요
			// => 새로운 요청을 발생시키므로 Redirect 방식 포워딩
			System.out.println("product업데이트완료");
			int productNum = 0;

			productNum = service.getProductNum(boardBean);// 방금 쓴 글prodcutNum가져오기
			if (productNum > 0) {
				boolean isImgSuccess = false;

				ProductImg productimg = new ProductImg();
				

				Enumeration files = multi.getFileNames();// Enumeration형식으로 업로드되 파일 이름 리턴

				int i = 1, j = 1, z = 1;

				while (files.hasMoreElements()) {
					String filestr = files.nextElement().toString();
					String board_original_file = multi.getOriginalFileName(filestr);
					int imgVal = Integer.parseInt(multi.getParameter("imgValue" + z));
					String board_file = null;

					if (imgVal == 1) {						
							board_file = name + "0" + imgVal + "_0" + i;	
							i++;
					} else {
					
							board_file = name + "0" + imgVal + "_0" + j;
							j++;
					}
					
					
					if (!filestr.equals("")) {

						String fullFileName = realFolder + "\\" + board_original_file;
						System.out.println(fullFileName);
						File f1 = new File(fullFileName);

						if (f1.exists()) {
							File newfile = new File(realFolder + "\\" + board_file+".png");
							System.out.println(newfile.toString());
							f1.renameTo(newfile);
						}

					}

					productimg.setProduct_num(productNum);
					productimg.setProduct_original_img(board_original_file);
					productimg.setProduct_img(board_file);
					productimg.setProduct_img_location(imgVal);

					isImgSuccess = service.registImgArticle(productimg);

					z++;
				}

			}

			forward = new ActionForward();
			forward.setPath("ProductList.ad");
			forward.setRedirect(true);
		}

		return forward;
	}

}
