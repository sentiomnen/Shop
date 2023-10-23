<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form method="post" action="" id="member" class="fluid">
	<main>
		<div class="input-text">
			<label for="user_id">아이디를 입려해주세요</label>
			<input type="text" name="user_id" id="user_id" placeholder="아이디를 입력해주세요" />
		</div>
		<div class="input-text">
			<label for="user_name">이름을 입려해주세요</label>
			<input type="text" name="user_name" id="user_name" placeholder="이름을 입력해주세요" />
		</div>
		<div class="input-text">
			<label for="user_email">이메일을 입려해주세요</label>
			<input type="text" name="user_email" id="user_email" placeholder="이메일을 입력해주세요" />
		</div>
	</main>
	<footer>
		<button class="secondary button" type="button" onclick="location.href='/member?tab=login'">로그인 하기</button>
		<button class="primary button" type="button" onclick="find_password()">비밀번호 찾기</button>
	</footer>
</form>