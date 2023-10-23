<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form id="member" class="fluid" method="post" action="/">
    <header>
        <h1>회원 로그인</h1>
        <p>Shop에 오신 것을 환영합니다.<br>지금 로그인하신 후 Shop의 다양한 서비스를 만나보세요.</p>
    </header>
    <main>
        <div class="input-text">
            <label for="id">아이디를 입력해주세요</label>
            <input type="text" name="id" id="id" placeholder="아이디를 입력해주세요">
            <p class="help"></p>
        </div>
        <div class="input-text">
            <label for="password">비밀번호를 입력해주세요</label>
            <input type="password" name="password" id="password" placeholder="비밀번호를 입력해주세요">
            <p class="help"></p>
        </div>
    </main>
    <footer>
        <button class="secondary button" type="button" onclick="location.href='/find-member?find=id'">아이디 또는 비밀번호 찾기</button>
        <button class="primary button" type="button" onclick="login()">로그인 하기</button>
    </footer>
</form>