/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bm.bootcampmanagement.controller;

import com.bm.bootcampmanagement.entities.Batchclass;
import com.bm.bootcampmanagement.entities.Employee;
import com.bm.bootcampmanagement.entities.Employeerole;
import com.bm.bootcampmanagement.entities.Participant;
import com.bm.bootcampmanagement.services.BCrypt;
import com.bm.bootcampmanagement.services.DBFileStorageService;
import com.bm.bootcampmanagement.services.MailService;
import com.bm.bootcampmanagement.services.EmployeeDAO;
import com.bm.bootcampmanagement.services.UploadFileResponse;
import com.bm.bootcampmanagement.services.bm.BatchclassDAO;
import com.bm.bootcampmanagement.services.bm.ParticipantDAO;
import com.bm.bootcampmanagement.services.cv.EmployeeRoleDAO;
import com.bm.bootcampmanagement.services.cv.ReligionDAO;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

/**
 *
 * @author FES
 */
@Controller
public class MainController {

    @Autowired
    EmployeeDAO daoEmp;
    @Autowired
    BatchclassDAO daoBC;
    @Autowired
    EmployeeRoleDAO daoEmpR;
    @Autowired
    ParticipantDAO daoP;
    @Autowired
    ReligionDAO daoR;
//    @Autowired
//    VillageDAO daoR;
    @Autowired
    private static Logger log = LoggerFactory.getLogger(MainController.class);

    @Autowired
    private MailService mailService;
    
    @Autowired
    private DBFileStorageService DBFileStorageService;

    @GetMapping("/")
    public String index() {
        return "index";
    }

    @PostMapping("/login")
//    @ResponseBody
    public String checkLogin(@RequestParam("idEmp") String id, @RequestParam("passEmp") String password, HttpSession session,HttpServletRequest request,HttpServletResponse response) {
        if (daoEmp.findById(id) != null) {
            Employee employee = daoEmp.findById(id);
            if (BCrypt.checkpw(password, employee.getPassword())) {
                request.getSession().setAttribute("login", employee);
                Iterable<Batchclass> batchclasses = daoBC.findAll();
                for (Batchclass data : batchclasses) {
                    if (data.getTrainer().equals(id)) {
                        System.out.println("masuk");
                        request.getSession().setAttribute("isTrainer", id);
                    }
                }
                Iterable<Employeerole> employeeroles = daoEmpR.findAll();
                for (Employeerole data : employeeroles) {
                    if (data.getEmployee().getId().equalsIgnoreCase(id)&&data.getRole().getId().equalsIgnoreCase("CVR0")) {
                        request.getSession().setAttribute("isAdmin", id);
                    }
                }
                Iterable<Participant> participants = daoP.findAll();
                for (Participant data : participants) {
                    if (data.getId().equalsIgnoreCase(id)) {
                        request.getSession().setAttribute("isParticipant", id);
                    }
                }
                
                return "redirect:/dashboard";
            }
        }
        return "redirect:/index/";
    }

    @PostMapping("/register")
//    @ResponseBody
    public String checkRegister(
            @RequestParam("empId") String id, @RequestParam("empName") String name, @RequestParam("empBirthplace") String birthplace, @RequestParam("empBirthdate") String birthdate, @RequestParam("empGender") String gender, @RequestParam("empReligion") String religion, 
            @RequestParam("empMarital") String maritalstatus, @RequestParam("empEmail") String email, @RequestParam("empPhone") String phone, @RequestParam("empAddress") String address, @RequestParam("empVillage") String village, @RequestParam("empOnboard") String onboarddate, @RequestParam("empHiring") String hiringlocation) {
        
        return "redirect:/dashboard";
    }

    @GetMapping("/dashboard")
    public String dashboard() {
        return "/dashboard";
    }
   
    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("dataReligion", daoR.findAll());
        return "/register";
    }
    
    @GetMapping("/upload")
    public String upload() {
        return "/upload";
    }
    
 
    @PostMapping("/uploadFile")
    public String uploadFile(@RequestParam("file") MultipartFile file) {
        Employee employee = DBFileStorageService.storeFile(file);
//
        String fileDownloadUri = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path("/downloadFile/")
                .path(employee.getId())
                .toUriString();

        new UploadFileResponse(employee.getName(), fileDownloadUri,
                file.getContentType(), file.getSize());
        return "redirect:/";
    }

//    @PostMapping("/uploadMultipleFiles")
//    public List<UploadFileResponse> uploadMultipleFiles(@RequestParam("files") MultipartFile[] files) {
//        return Arrays.asList(files)
//                .stream()
//                .map(file -> uploadFile(file))
//                .collect(Collectors.toList());
//    }
    
     @GetMapping("/downloadFile/{fileId}")
    public ResponseEntity<Resource> downloadFile(@PathVariable String fileId) {
        // Load file from database
         Employee employee = DBFileStorageService.getFile(fileId);

        return ResponseEntity.ok()
                .contentType(MediaType.IMAGE_JPEG)
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + employee.getName() + "\"")
                .body(new ByteArrayResource(employee.getPhoto()));
    }
    
    @GetMapping("/lihatFile")
    public ResponseEntity<byte[]> getImage() throws IOException {
        Employee employee = DBFileStorageService.getFile("14304");

        return ResponseEntity
                .ok()
                .contentType(MediaType.IMAGE_JPEG)
                .body(employee.getPhoto());
    }
    
    @GetMapping("/logout")
    public String logout(HttpServletRequest request){
        request.getSession().removeAttribute("login");
        request.getSession().removeAttribute("isAdmin");
        request.getSession().removeAttribute("isTrainer");
        request.getSession().removeAttribute("isParticipant");
        return "redirect:/";
    }
}
