package com.asapmu.parumu.config;

import com.asapmu.parumu.repository.ModuleRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.io.Resource;
import org.springframework.jdbc.datasource.init.ScriptUtils;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.sql.Connection;

@Component
@RequiredArgsConstructor
public class DatabaseSeeder implements CommandLineRunner {

    private final ModuleRepository moduleRepository;
    private final DataSource dataSource;

    @Value("classpath:sql/data-materi.sql")
    private Resource dataScript;

    @Override
    public void run(String... args) throws Exception {
        if (moduleRepository.count() == 0) {
            System.out.println("⚠️ Database kosong. Memulai proses seeding data dari file SQL...");

            try (Connection connection = dataSource.getConnection()) {
                ScriptUtils.executeSqlScript(connection, dataScript);
                System.out.println("✅ Seeding data selesai! Materi berhasil dimuat.");
            } catch (Exception e) {
                System.err.println("❌ Gagal menjalankan seeding data: " + e.getMessage());
                e.printStackTrace();
            }
        } else {
            System.out.println("ℹ️ Database sudah berisi data. Melewati proses seeding.");
        }
    }
}