package com.kbstar.dto;

import lombok.*;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Cust {
    //미리 정한 사이즈 이외에는 에러
    @Size(min=4, max=10, message = "ID는 최소 4자리 이상 최대 `10자리 이하입니다.")
    @NotEmpty
    private String id;

    @Size(min=5, max=10, message = "PASSWORD는 최소 5자리 이상 최대 `10자리 이하입니다.")
    @NotEmpty(message = "PASSWORD는 최소 5자리 이상 최대 `10자리 이하입니다.")
    private String pwd;

    @NotEmpty(message = "이름 적어")
    private String name;


}
