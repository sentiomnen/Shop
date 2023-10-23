<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<article>
    <form id="member" class="fluid" method="post" action="/">
        <header>
            <h1>회원 관리</h1>
            <p>Shop에 오신 것을 환영합니다.<br>지금 로그인하신 후 Shop의 다양한 서비스를 만나보세요.</p>
        </header>
        <main>
            <div>
                <p>아이디 : ${sessionScope.ssKey.id}</p>
                <p>이름 : ${sessionScope.ssKey.name}</p>
                <p>이메일 : ${sessionScope.ssKey.email}</p>
                <p>연락처 : 0${sessionScope.ssKey.phone}</p>
            </div>
            <div class="input-text">
                <label for="id">아이디를 입력해주세요</label>
                <input type="text" name="id" id="id" placeholder="아이디를 입력해주세요">
                <p class="help"></p>
            </div>
        </main>
        <footer>
            <button class="primary button" type="button" onclick="login()">회원정보 변경</button>
        </footer>
    </form>

</article>