package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.qnaAction.QnaDeleteProAction;
import action.qnaAction.QnaDetailAction;
import action.qnaAction.QnaListAction;
import action.qnaAction.QnaModifyFormAction;
import action.qnaAction.QnaModifyProAction;
import action.qnaAction.QnaReplyFormAction;
import action.qnaAction.QnaReplyProAction;
import action.qnaAction.QnaWriteProAction;
import vo.ActionForward;

@WebServlet("*.qa")
public class QnaBoardController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// POST 방식 요청에 대한 한글 처리(UTF-8)
		request.setCharacterEncoding("UTF-8");

		String command = request.getServletPath();
		System.out.println("command : " + command);

		// Action 클래스로부터 리턴받아 포워딩 정보를 관리하는 ActionForward 타입 변수 선언
		ActionForward forward = null;
		// 각 Action 클래스의 인스턴스를 공통으로 관리하는 Action 타입 변수 선언
		Action action = null;

		if (command.equals("/QnaWriteForm.qa")) {
			// 글쓰기 작업을 위한 뷰페이지로 포워딩
			forward = new ActionForward();
			forward.setPath("/qna/qna_board_write.jsp");
			forward.setRedirect(false); // Dispatcher 방식(기본값이므로 생략 가능)
		} else if (command.equals("/QnaWritePro.qa")) {
			action = new QnaWriteProAction();
			try {
				// 업캐스팅 후에도 공통 메서드(상속받은 메서드)는 호출이 가능하므로
				// Action 타입으로 execute() 메서드 호출 가능함
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/QnaList.qa")) {

			action = new QnaListAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/QnaDetail.qa")) {
			// 글 상세 정보 조회 작업 요청을 위한 비즈니스 로직 수행
			action = new QnaDetailAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/QnaDeleteForm.qa")) {
			// 글삭제 작업을 위한 뷰페이지로 포워딩
			forward = new ActionForward();
			forward.setPath("/qna/qna_board_delete.jsp");
			forward.setRedirect(false); // Dispatcher 방식(기본값이므로 생략 가능)
		} else if (command.equals("/QnaDeletePro.qa")) {
			// 글 삭제 작업 요청을 위한 비즈니스 로직 수행
			action = new QnaDeleteProAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/QnaModifyForm.qa")) {
			// 글 삭제 폼 요청을 위한 비즈니스 로직 수행
			action = new QnaModifyFormAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/QnaModifyPro.qa")) {
			// 글 삭제 작업 요청을 위한 비즈니스 로직 수행
			action = new QnaModifyProAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/QnaReplyForm.qa")) {
			// 글 답변 등록 폼 요청 작업을 위한 비즈니스 로직 수행
			action = new QnaReplyFormAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/QnaReplyPro.qa")) {
			// 글 답변 등록 작업 요청을 위한 비즈니스 로직 수행
			action = new QnaReplyProAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (forward != null) {

			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());

				dispatcher.forward(request, response);
			}
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}
