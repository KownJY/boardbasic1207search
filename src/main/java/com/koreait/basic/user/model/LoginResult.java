package com.koreait.basic.user.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
//빌더는 생성자를 이용하여 값을 넣을 수 있는 디자인 패턴을 만들어주는?
//
public class LoginResult {
    private final int result;
    private final UserEntity loginUser;

}
