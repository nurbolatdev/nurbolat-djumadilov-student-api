package kz.iitu.studentapi;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@SpringBootTest
@AutoConfigureMockMvc
class StudentControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    void createAndGetStudent() throws Exception {
        String json = """
                {"firstName":"Nurbolat","lastName":"Djumadilov",
                 "email":"nurbolat.test@iitu.edu.kz","groupName":"IT2-2313"}
                """;
        mockMvc.perform(post("/api/students").contentType(MediaType.APPLICATION_JSON).content(json))
                .andExpect(status().isCreated())
                .andExpect(jsonPath("$.lastName").value("Djumadilov"));

        mockMvc.perform(get("/api/students"))
                .andExpect(status().isOk());
    }

    @Test
    void notFoundStudentReturns404() throws Exception {
        mockMvc.perform(get("/api/students/9999"))
                .andExpect(status().isNotFound());
    }
}
