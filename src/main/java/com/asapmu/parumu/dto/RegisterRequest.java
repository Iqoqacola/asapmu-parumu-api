package com.asapmu.parumu.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
public class RegisterRequest {

    @NotBlank(message = "Username tidak boleh kosong!")
    private String username;

    @NotBlank(message = "Nama lengkap tidak boleh kosong!")
    private String namaLengkap;

    @NotBlank(message = "Password tidak boleh kosong!")
    @Size(min = 8, message = "Minimal password 8 karakter!")
    private String password;

    @NotBlank(message = "Konfirmasi password tidak boleh kosong!")
    private String konfirmasiPassword;
}
