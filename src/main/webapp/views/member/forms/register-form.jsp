<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form id="member" class="fluid" method="post" action="/register.do">
    <header>
        <h1>구매 회원가입</h1>
        <p>Shop에 오신 것을 환영합니다.<br>지금 회원 가입하신 후 Shop의 다양한 서비스를 만나보세요.</p>
    </header>
    <main>
        <div class="input-text">
            <label for="id">ID를 만들어주세요</label>
            <input type="text" name="id" id="id" placeholder="띄어쓰기 없이 영/숫자 6-10자">
            <p class="help"></p>
        </div>
        <div class="input-text">
            <label for="password">비밀번호를 설정해주세요</label>
            <input type="password" name="password" id="password" placeholder="8-15자의 영문 대소문자, 숫자 또는 특수문자 조합">
            <label for="repeat_pw">위의 비밀번호를 다시 입력해주세요</label>
            <input type="password" name="repeat_pw" id="repeat_pw" placeholder="비밀번호를 다시 입력해주세요"/>
            <p class="help"></p>
        </div>
        <div class="input-text">
            <label for="name">이름을 입력해주세요</label>
            <input type="text" name="name" id="name" placeholder="이름을 입력해주세요" />
            <p class="help"></p>
        </div>
        <div id="phone" class="input-text">
            <label for="phone">휴대전화 번호를 입력해주세요</label>
            <input type="tel" name="phone" id="phone" pattern="[0-9]{3}[0-9]{4}[0-9]{4}" placeholder="숫자만 입력해주세요"/>
            <p class="help"></p>
        </div>
        <div class="input-text">
            <label for="email">이메일을 입력해주세요</label>
            <input type="email" name="email" id="email" placeholder="이메일을 입력해주세요" />
            <p class="help"></p>
        </div>
        <div id="address">
            <section>
                <div class="input-text">
                    <input type="text" name="zipcode" id="zipcode" placeholder="우편번호" readonly />
                    <p class="help"></p>
                </div>
                <div class="input-text">
                    <input type="text" name="addr" id="addr" placeholder="주소를 입력해주세요" readonly />
                    <p class="help"></p>
                </div>
                <button class="secondary button" type="button" onclick="set_address()">주소 찾기</button>
            </section>
            <div class="input-text">
                <label for="addr2">상세 주소를 입력해주세요</label>
                <input type="email" name="addr2" id="addr2" placeholder="상세 주소를 입력해주세요" />
                <p class="help"></p>
            </div>
        </div>
    </main>
    <footer>
        <button class="primary button" type="button" onclick="register()">회원가입 하기</button>
    </footer>
</form>