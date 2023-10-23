package com.ecom.shop.product.web;

import com.ecom.shop.common.dto.PageDTO;
import com.ecom.shop.member.dto.MemberDTO;
import com.ecom.shop.product.dto.ProductDTO;
import com.ecom.shop.product.service.ProductService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

@Controller
@RequestMapping("/products")
public class ProductController {
    @Autowired
    ProductService productService;
    @Value("${resources.location}")
    String uploadPath;

    @RequestMapping("/manage")
    public String admin(HttpServletRequest req, HttpServletResponse resp,
                        Model model, MemberDTO member) {
        String url = "products/management";
        HttpSession session = req.getSession();
        try {
            MemberDTO ssKey = (MemberDTO) session.getAttribute("ssKey");
            String role = ssKey.getRole();
            if (role.equals("admin")) {
                PageDTO page = new PageDTO();
                page.setRow(30);
                page.setStart(Integer.parseInt(req.getParameter("page")));
                List<ProductDTO> productList = productService.list(page, "no", 0);
                if (productList.get(0) == null) productList = null;
                int pageCount  = productService.count();
                int pageAmount = pageCount/PageDTO.ROW_PER_PAGE + 1;

                model.addAttribute("pageUnit",    PageDTO.ROW_PER_PAGE);
                model.addAttribute("pageCount",   pageCount);
                model.addAttribute("pageAmount",  pageAmount);
                model.addAttribute("productList", productList);
            }
        } catch (Exception e) {
            url = "redirect:/";
        }
        return url;
    }
    @RequestMapping("/list")
    public String list(HttpServletRequest req, HttpServletResponse resp,
                        Model model, ProductDTO product) {
        HttpSession session = req.getSession();
        PageDTO page = new PageDTO();
        page.setRow(30);
        page.setStart(Integer.parseInt(req.getParameter("page")));
        List<ProductDTO> productList = productService.list(page, "no", 0);
        if (productList.get(0) == null) productList = null;
        int pageCount  = productService.count();
        int pageAmount = pageCount/page.getRow()+ 1;

        model.addAttribute("pageUnit",    page.getRow());
        model.addAttribute("pageCount",   pageCount);
        model.addAttribute("pageAmount",  pageAmount);
        model.addAttribute("productList", productList);
        return "products/list";
    }

    @GetMapping("/edit")
    public String edit(HttpServletRequest req, HttpServletResponse resp,
                       Model model, ProductDTO product) {
        HttpSession session = req.getSession();
        try {
            MemberDTO ssKey = (MemberDTO) session.getAttribute("ssKey");
            String role = ssKey.getRole();
            if (role.equals("admin")) {
                int no = Integer.parseInt(req.getParameter("no"));
                product = productService.getProduct(no);
                model.addAttribute("product", product);
            }
        } catch (Exception e) {}
        return "products/edit";
    }
    @GetMapping("/view")
    public String view(HttpServletRequest req, HttpServletResponse resp,
                       Model model, ProductDTO product) {
        HttpSession session = req.getSession();
        int no = Integer.parseInt(req.getParameter("no"));
        product = productService.getProduct(no);
        model.addAttribute("product", product);
        return "products/view";
    }
    @GetMapping("/insert")
    public String insert(HttpServletRequest req, HttpServletResponse resp,
                         Model model, ProductDTO product) {
        return "products/insert";
    }
    //Region Action methods
    @PostMapping("/list.do")
    @ResponseBody
    public String doList(HttpServletRequest req, HttpServletResponse resp,
                           Model model, ProductDTO product) throws JsonProcessingException {
        String sort = req.getParameter("sort");
        int dir = Integer.parseInt(req.getParameter("dir"));

        PageDTO page = new PageDTO();
        page.setRow(30);
        page.setStart(Integer.parseInt(req.getParameter("page")));
        ObjectMapper mapper = new ObjectMapper();
        List<ProductDTO> productList = productService.list(page, sort, dir);
        String result = mapper.writeValueAsString(productList);
        return result;
    }
    @PostMapping("/insert.do")
    public String doInsert(HttpServletRequest req, HttpServletResponse resp,
                           Model model, ProductDTO product,
                           @RequestParam("upload") MultipartFile file) {
        HttpSession session = req.getSession();
        MemberDTO   ssKey   = (MemberDTO) session.getAttribute("ssKey");
        if (ssKey != null && ssKey.getRole().equals("admin")) {
            product.setPath(uploadPath);
            // Set File name
            String sourceFileName = file.getOriginalFilename();
            if(sourceFileName == null || sourceFileName.isEmpty()) product.setImage("ready.jpg");
            else product.setImage(sourceFileName);
            File targetFile = new File(product.getPath() + "/"  + product.getImage());
            targetFile.getParentFile().mkdirs();
            try {
                file.transferTo(targetFile);
            } catch (IOException e) {
                e.printStackTrace();
            }

            productService.addItem(product);
        }

        return "redirect:/products/manage";
    }
    @PostMapping("/delete.do")
    @ResponseBody
    public String doDelete(HttpServletRequest req, HttpServletResponse resp,
                           Model model, ProductDTO product) {
        int no = Integer.parseInt(req.getParameter("no"));
        int result = productService.delete(no);
        String success = "false";
        if (result > 0) success = "true";
        return success;
    }
    @PostMapping("/edit.do")
    public String doEdit(HttpServletRequest req, HttpServletResponse resp,
                           Model model, ProductDTO product,
                           @RequestParam("upload") MultipartFile file) {
        HttpSession session = req.getSession();
        MemberDTO   ssKey   = (MemberDTO) session.getAttribute("ssKey");
        if (ssKey != null && ssKey.getRole().equals("admin")) {
            product.setPath(uploadPath);
            // Set File name
            String sourceFileName = file.getOriginalFilename();
            if(sourceFileName == null || sourceFileName.isEmpty()) product.setImage("ready.jpg");
            else product.setImage(sourceFileName);
            File targetFile = new File(product.getPath() + "/"  + product.getImage());
            targetFile.getParentFile().mkdirs();
            try {
                file.transferTo(targetFile);
            } catch (IOException e) {
                e.printStackTrace();
            }

            System.out.println(product);
            productService.edit(product);
        }

        return "redirect:/products/manage?page=1";
    }

    @RequestMapping("/load.do")
    @ResponseBody
    public Resource load(String filename) throws IOException {
        if (filename == null || filename.length() == 0) filename = "ready.jpg";
        Resource resource = new InputStreamResource(Files.newInputStream(Path.of(uploadPath + "/" + filename)));

        return resource;
    }
    //End Region Action methods
}
